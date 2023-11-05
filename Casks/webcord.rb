cask "webcord" do
  version "4.5.1"

  on_arm do
    sha256 "d30e934ab343ce4cef34b2cc2ec2160093fef11d5c9fcc5ece20a0a5ff50b2f3"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2802cf5a757aa94d20727c2e259acfa072c54325ca6a80489c052975b0f80783"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
