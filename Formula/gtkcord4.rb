class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.16-1.tar.gz"
  sha256 "d856bcfe4a8e80957f2626fb7068aa83e4af18255c629ee164d1b01e6cbf2147"
  license "GPL-3.0-or-later"

  # This formula doesn't currently build, due to some issues with PKG_CONFIG_PATH.
  # Adding (almost) every transitive depedency worked at one point, but I got tired of maintaining the list
  disable! date: "2023-09-14", because: :does_not_build

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
