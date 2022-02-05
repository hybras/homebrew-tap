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
    std_cargo_args_with_path = std_cargo_args
    path_arg_idx = std_cargo_args_with_path.index("--path")
    std_cargo_args = std_cargo_args_with_path[0..path_arg_idx] + std_cargo_args_with_path[(path_arg_idx + 1)..]

    system "cargo", "install", *std_cargo_args, "--path", "czkawka_gui"
    system "cargo", "install", *std_cargo_args, "--path", "czkawka_cli"
  end

  test do
    system "false"
  end
end
