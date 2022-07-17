class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "bca33768dfd7695cfc8e16e6d0ff0f627b23ae47065cf04e461ef41fcdcf30f5"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk4" => :build
  depends_on "libcanberra" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord", "--help"
  end
end
