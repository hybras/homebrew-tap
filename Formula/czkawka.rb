# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Czkawka < Formula
  desc "Find duplicates, empty folders, similar images etc."
  homepage "https://github.com/qarmin/czkawka"
  url "https://github.com/qarmin/czkawka/archive/refs/tags/4.0.0.tar.gz"
  sha256 "c9202d8cd0060883c288e6ee99444f0f24c57c6291d84bef9f4c8d3a11aad443"
  license "MIT"

  depends_on "rust" => :build
  depends_on "gtk+3"
  depends_on "adwaita-icon-theme"
  depends_on "ffmpeg"
  depends_on "librsvg"

  def install
    system "cargo", "build", "--workspace", "--release", "--frozen", "--locked"
    bin.install "target/release/czkawka_gui"
    bin.install "target/release/czkawka_cli"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test czkawka`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
