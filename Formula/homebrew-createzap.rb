class HomebrewCreatezap < Formula
  desc "Homebrew external command that generates zap stanzaz for casks"
  homepage "https://github.com/hybras/homebrew-createzap"
  url "https://github.com/hybras/homebrew-createzap/archive/v0.1.0.tar.gz",
      verified: "github.com/hybras/homebrew-createzap"
  sha256 "c0f907f775418e4f35cc8502366bc0ad1f87b3e3ac366b350ea03dd27fc3a6c2"
  license "MIT"

  depends_on "fd"

  def install
    bin.install "brew-createzap"
  end

  test do
    system "brew-createzap"
  end
end
