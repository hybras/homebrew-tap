# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Nitter < Formula
  desc "Twitter front-end"
  homepage "https://github.com/zedeus/nitter"
  license "AGPL-v3"
  head "https://github.com/zedeus/nitter.git"

  depends_on "nim" => :build
  depends_on "libsass"
  depends_on "pcre"
  depends_on "redis"

  def install
    system "nimble", "build", "-d:release", "-y"
    system "nimble", "scss"
    system "nimble", "md"
    bin.install "nitter"
    etc.install "nitter.example.conf", "nitter.conf"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test nitter`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
