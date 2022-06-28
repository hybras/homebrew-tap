# This formula is deprecated in favor of running asciidoctor in a docker container
class AsciidoctorMathematicalDeps < Formula
  desc "Convert math to images in asciidoc files"
  homepage "https://docs.asciidoctor.org/asciidoctor/latest/stem/mathematical/"
  license "MIT"
  url "https://github.com/asciidoctor/asciidoctor-mathematical/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "1485a042cf7d7835659bebf287449be7918337738d9fa2ef6044810e9129fb89"
  head "https://github.com/asciidoctor/asciidoctor-mathematical"

  uses_from_macos "ruby"

  depends_on "glib"
  depends_on "gdk-pixbuf"
  depends_on "cairo"
  depends_on "pango"
  depends_on "cmake" => :build

  # fonts
  # depends_on "font-jsmath-cmex10"
  # depends_on "font-jsmath-cmmi10"
  # depends_on "font-jsmath-cmr10"
  # depends_on "font-jsmath-cmsy10"
  # depends_on "font-jsmath-cmex10"


  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # ENV["GEM_HOME"] = libexec
    # system "gem", "build", "#{name}.gemspec"
    # system "gem", "install", "#{name}-#{version}.gem"
    # bin.install libexec/"bin/#{name}"
    # bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test asciidoctor-mathematical-deps`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
