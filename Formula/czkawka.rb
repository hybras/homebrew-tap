class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/6.0.0.tar.gz"
  sha256 "32dc1d8a55bc3ce478246830a1f81679affa85735e69aa049fd83e30271e368f"
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
