class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.12.tar.gz"
  sha256 "eecd4cf4ce7848e94b4c52d6fda4f681f0448624e49b76db02ad18110a4602c3"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "gobject-introspection"
  depends_on "gtk4"
  depends_on "libcanberra"
  depends_on "gdk-pixbuf"
  depends_on "cairo"
  depends_on "glib"
  depends_on "pango"
  depends_on "gstreamer"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord4", "--help"
  end
end
