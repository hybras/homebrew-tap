class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "db60a1f76ba75037805a538f17fd6d8f889e4c6c064ad59ec8f2daf67d816ca7"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk4" => :build
  depends_on "libcanberra"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord", "--help"
  end
end
