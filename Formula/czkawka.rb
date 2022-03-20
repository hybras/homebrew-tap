class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/4.0.1.tar.gz"
  sha256 "adbeabaf1fa3ffd29b809edbf39af94d99065a5911e8fd2358115032d7d85dd1"
  license "MIT"

  depends_on "rust" => :build
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "gtk+3"
  depends_on "librsvg"

  def install
    system "cargo", "build", "--workspace", "--release", "--frozen", "--locked"
    bin.install "target/release/czkawka_gui"
    bin.install "target/release/czkawka_cli"
  end

  test do
    system "false"
  end
end
