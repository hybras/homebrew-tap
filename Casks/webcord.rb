cask "webcord" do
  version "4.10.4"

  on_arm do
    sha256 "1c6f586cdc00f4d4595ac03cc1ef174be6a6517c1329dd240765ecd0941f3bcb"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "37ed2a28021f491cd3e74b51ae27d41dfcb84e22b543eb41dfb10b2a316b67fe"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
