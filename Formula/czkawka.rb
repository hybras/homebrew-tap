class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/5.0.2.tar.gz"
  sha256 "5c3b0a3017804037d742a18c302b405206def6d569e752c7ebc2adb3ccc45421"
  license "MIT"

  depends_on "rust" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gtk+3"
  depends_on "librsvg"

  def install
    system "cargo", "install", *std_cargo_args(path: "czkawka_gui")
    system "cargo", "install", *std_cargo_args(path: "czkawka_cli")
  end

  test do
    system "false"
  end
end
