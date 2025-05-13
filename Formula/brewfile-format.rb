class BrewfileFormat < Formula
  desc "Format brew bundle files"
  homepage "https://gitlab.com/hybras/brewfile-format"
  url "https://gitlab.com/hybras/brewfile-format/-/archive/v0.2.0/brewfile-format-v0.2.0.tar.gz"
  sha256 "52b08e5153f9889eb385d177425ac371596a97edf2607cef1206e06d8b5c041c"
  license any_of: ["Apache-2.0", "MIT"]
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
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
