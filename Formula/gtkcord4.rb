class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.13.tar.gz"
  sha256 "3697c0900e72e60421d75283ca87e5703603eaeaac9d064adaa5dcd09c0c944d"
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
