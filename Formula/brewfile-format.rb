# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class BrewfileFormat < Formula
  desc ""
  homepage ""
  url "https://gitlab.com/hybras/brewfile-format.git"
  version "0.1.0"
  sha256 "a719d49dc346f91d5b26c9c97564a761ec6783bd8db2f514cfc334aad44b5fae"
  license "apache OR mit"
  head "https://gitlab.com/hybras/brewfile-format.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test brewfile-format`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
