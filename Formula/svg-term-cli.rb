class SvgTermCli < Formula
  desc "Render your terminal as svg animations"
  homepage "https://github.com/marionebl/svg-term-cli"
  url "https://registry.npmjs.org/svg-term-cli/-/svg-term-cli-2.1.1.tgz"
  sha256 "ae65f9234b31b68ed1c27ca28eff4dddf599268a58f22b4150711bc2ce947aec"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    resource "testdata" do
      url "https://asciinema.org/a/569727.cast?dl=1"
      sha256 "fcc69956aef7b2a2f69c1cf6924c4290b5598bd85dbc25e7079d3421ad0d083d"
    end
    resource("testdata").stage do
      system bin/"svg-term", "--in=569727.cast", "--out", "parrot.svg"
      assert_match "<svg", File.read("parrot.svg")
    end
  end
end
