class Amberol < Formula
  desc "Music Player"
  homepage "https://apps.gnome.org/app/io.bassi.Amberol/"
  url "https://gitlab.gnome.org/World/amberol/-/archive/0.10.3/amberol-0.10.3.tar.gz"
  sha256 "52372ec6f5ba066409e8dfc4a62fdb2c57e79f83a809cf295ff0e040eebb233b"
  license "GPL-3.0-or-later"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "python" => :build
  depends_on "rust" => :build
  depends_on "xz" => :build
  depends_on "dbus"
  depends_on "desktop-file-utils"
  depends_on "gettext"
  depends_on "gstreamer"
  depends_on "gtk4"
  depends_on "libadwaita"

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

    gdbus = formula_opt_bin("glib")/"gdbus"
    playback_status = [
      gdbus, "call", "--session",
      "--dest", "org.mpris.MediaPlayer2.io.bassi.Amberol",
      "--object-path", "/org/mpris/MediaPlayer2",
      "--method", "org.freedesktop.DBus.Properties.Get",
      "org.mpris.MediaPlayer2.Player", "PlaybackStatus"
    ]
    # Amberol reports CanQuit=false over MPRIS, so use its GApplication quit action.
    quit = [
      gdbus, "call", "--session",
      "--dest", "io.bassi.Amberol",
      "--object-path", "/io/bassi/Amberol",
      "--method", "org.gtk.Actions.Activate", "quit", "[]", "{}"
    ]

    # test.mp4 is video-only, so an audio player loads it but has nothing to play.
    { "test.mp3" => "Playing", "test.m4a" => "Playing", "test.mp4" => "Paused" }.each do |fixture, expected|
      app = spawn bin/"amberol", test_fixtures(fixture)
      begin
        status = ""
        40.times do
          status = Utils.popen_read(*playback_status, err: :close)
          break if status.include?(expected)

          sleep 0.5
        end
        assert_match expected, status, "#{fixture} did not reach #{expected}"

        system(*quit)
        _, exit_status = Timeout.timeout(10) { Process.wait2(app) }
        app = nil
        assert_predicate exit_status, :success?, "amberol exited unsuccessfully after #{fixture}"
      ensure
        if app
          Process.kill("KILL", app)
          Process.wait(app)
        end
      end
    end
  ensure
    if dbus
      Process.kill("TERM", dbus)
      Process.wait(dbus)
    end
  end
end
