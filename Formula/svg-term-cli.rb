require "language/node"

class SvgTermCli < Formula
  desc "Render your terminal as svg animations"
  homepage "https://github.com/marionebl/svg-term-cli"
  url "https://github.com/marionebl/svg-term-cli/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "4cd8fbc52a5d67dcccc49e069b05d90a6bdb650b24048df8afb36abfcd774f75"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    resource "testdata" do
      url "https://asciinema.org/a/569727.cast?dl=1"
      sha256 "fcc69956aef7b2a2f69c1cf6924c4290b5598bd85dbc25e7079d3421ad0d083d"
    end
    resource("testdata").stage do
      system "#{bin}/svg-term", "--in=569727.cast", "--out", "examples/parrot.svg"
    end
  end
end
