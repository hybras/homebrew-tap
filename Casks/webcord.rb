cask "webcord" do
  version "3.8.1"

  on_intel do
    sha256 "ba6d1025b28fda9e197e253b6cc2c35b1a28c65da33d574df9b2a9a52b513ab5"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "672a89df13931ad6074e757314c2a7359d15b6fbfc225841aa407ae48259ea46"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
