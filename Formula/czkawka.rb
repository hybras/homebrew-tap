class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/5.0.1.tar.gz"
  sha256 "d06730332adba52d343fa46191fc370b41a9a355ad0eeb354dd872773bb0cd20"
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
