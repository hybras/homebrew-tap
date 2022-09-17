class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.4-2.tar.gz"
  sha256 "2fd84a974746ef3517d6e4868adf7d75bd51a70ccddcc56c49d9d03faefe2af3"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk4" => :build
  depends_on "libcanberra"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  service do
    run bin / "gtkcord4"
    log_path var / "log" / "gtkcord4.log"
    error_log_path var / "log" / "gtkcord4.log"
    process_type :interactive
  end

  test do
    system bin.to_s/"gtkcord", "--help"
  end
end
