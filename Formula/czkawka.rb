class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/4.1.0.tar.gz"
  sha256 "3399a2878554692fd00b16226248727bdcf1188d247d584d28ded35800fb42ba"
  license "MIT"

  depends_on "rust" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gtk+3"
  depends_on "librsvg"

  def install
    system "cargo", "install", *std_cargo_args, "--bin", "czkawka_gui"
    system "cargo", "install", *std_cargo_args, "--bin", "czkawka_cli"
  end

  test do
    system "false"
  end
end
