class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.14.tar.gz"
  sha256 "9e4f0de7cbe462cc3b74361f0590578d35d5436fb91793cb8351086b5d80ef26"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "cairo"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "gstreamer"
  depends_on "gtk4"
  depends_on "libcanberra"
  depends_on "pango"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord4", "--help"
  end
end
