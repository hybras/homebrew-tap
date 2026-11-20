class Amberol < Formula
  desc "Music Player"
  homepage "https://apps.gnome.org/app/io.bassi.Amberol/"
  url "https://gitlab.gnome.org/World/amberol/-/archive/2026.1/amberol-2026.1.tar.gz"
  sha256 "2112eebac5c7b0aab7243c428c794aecb136168c326648cfbbd8654ea2cc7631"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    sha256 cellar: :any, arm64_tahoe: "16dff4c30ded4d63356baf91074ef7457e035cabd00ff3b32133135a676d9425"
  end

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "python" => :build
  depends_on "rust" => :build
  depends_on "xz" => :build
  depends_on "cairo"
  depends_on "dbus"
  depends_on "desktop-file-utils"
  depends_on "gdk-pixbuf"
  depends_on "gettext"
  depends_on "glib"
  depends_on "graphene"
  depends_on "gstreamer"
  depends_on "gtk4"
  depends_on "harfbuzz"
  depends_on "libadwaita"
  depends_on "pango"

  on_linux do
    depends_on "xorg-server" => :test
  end

  def install
    # The gettext copy vendored by gettext-sys fails to compile with modern clang
    ENV["GETTEXT_DIR"] = formula_opt_prefix("gettext")
    # Skip meson's gnome.post_install (schema compile, icon cache) inside the keg; done in post_install_steps
    ENV["DESTDIR"] = "/"

    system "meson", "setup", "_builddir", ".", *std_meson_args
    system "meson", "compile", "-C", "_builddir"
    system "meson", "install", "-C", "_builddir"
  end

  post_install_steps do
    compile_gsettings_schemas
    update_gtk_icon_cache
  end

  test do
    require "timeout"

    # Amberol needs a session bus; run a private one. The path is relative because
    # testpath is longer than the maximum unix socket path length.
    ENV["DBUS_SESSION_BUS_ADDRESS"] = "unix:path=bus"
    dbus = spawn formula_opt_bin("dbus")/"dbus-daemon", "--session", "--nofork",
                 "--address=#{ENV["DBUS_SESSION_BUS_ADDRESS"]}"
    Timeout.timeout(10) { sleep 0.1 until (testpath/"bus").exist? }

    # Opening a window aborts in the macOS test sandbox: GDK cannot reach the
    # WindowServer or LaunchServices because mach-lookup is denied.
    if OS.mac?
      assert_match "--help-gapplication", shell_output("#{bin}/amberol --help")
      return
    end

    # Amberol needs a display; run a virtual one when there is none (e.g. in CI).
    if ENV.exclude?("DISPLAY")
      read_io, write_io = IO.pipe
      xvfb = spawn formula_opt_bin("xorg-server")/"Xvfb", "-displayfd", write_io.fileno.to_s,
                   "-nolisten", "unix", "-listen", "tcp", write_io => write_io
      write_io.close
      ENV["DISPLAY"] = "127.0.0.1:#{read_io.gets.strip}"
    end

    # CI has no audio server, so playback stops when the default sink fails to connect.
    ENV["GST_PLUGIN_FEATURE_RANK"] = "fakeaudiosink:MAX"

    # Homebrew's audio fixtures finish playing before their status can be polled.
    tone_buffers = 500 # About 12 seconds of audio.
    system formula_opt_bin("gstreamer")/"gst-launch-1.0", "--quiet",
           "audiotestsrc", "num-buffers=#{tone_buffers}", "!", "wavenc", "!", "filesink", "location=tone.wav"

    gdbus = formula_opt_bin("glib")/"gdbus"
    playback_status = [
      gdbus, "call", "--session",
      "--dest", "org.mpris.MediaPlayer2.io.bassi.Amberol",
      "--object-path", "/org/mpris/MediaPlayer2",
      "--method", "org.freedesktop.DBus.Properties.Get",
      "org.mpris.MediaPlayer2.Player", "PlaybackStatus"
    ]
    play = [
      gdbus, "call", "--session",
      "--dest", "org.mpris.MediaPlayer2.io.bassi.Amberol",
      "--object-path", "/org/mpris/MediaPlayer2",
      "--method", "org.mpris.MediaPlayer2.Player.Play"
    ]
    # Amberol reports CanQuit=false over MPRIS, so use its GApplication quit action.
    quit = [
      gdbus, "call", "--session",
      "--dest", "io.bassi.Amberol",
      "--object-path", "/io/bassi/Amberol",
      "--method", "org.gtk.Actions.Activate", "quit", "[]", "{}"
    ]

    app = spawn bin/"amberol", testpath/"tone.wav"
    begin
      status = ""
      40.times do
        status = Utils.popen_read(*playback_status, err: :close)
        break if status.include?("Playing")

        # Amberol doesn't always start playing files it was opened with.
        quiet_system(*play)
        sleep 0.5
      end
      assert_match "Playing", status

      system(*quit)
      _, exit_status = Timeout.timeout(10) { Process.wait2(app) }
      app = nil
      assert_predicate exit_status, :success?
    ensure
      if app
        Process.kill("KILL", app)
        Process.wait(app)
      end
    end
  ensure
    [dbus, xvfb].compact.each do |pid|
      Process.kill("TERM", pid)
      Process.wait(pid)
    end
  end
end
