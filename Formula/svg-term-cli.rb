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
    (testpath/"hello.cast").write <<~JSON
      {"version": 2, "width": 20, "height": 2}
      [0.1, "o", "Homebrew"]
    JSON
    system bin/"svg-term", "--in=hello.cast", "--out=hello.svg"
    assert_match "Homebrew", (testpath/"hello.svg").read
  end
end
