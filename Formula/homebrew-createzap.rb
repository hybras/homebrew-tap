class HomebrewCreatezap < Formula
  desc "Homebrew external command that generates zap stanzaz for casks"
  homepage "https://github.com/hybras/homebrew-createzap"
  url "https://github.com/hybras/homebrew-createzap/archive/v0.2.0.tar.gz",
      verified: "github.com/hybras/homebrew-createzap"
  sha256 "ea7c8dd6a212ee7c1f074c689df29890399c388c22ea0c622857477200130ed1"
  license "MIT"

  depends_on "fd"

  def install
    bin.install "brew-createzap"
  end

  test do
    system bin/"brew-createzap"
  end
end
