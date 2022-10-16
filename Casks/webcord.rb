cask "webcord" do
  version "3.8.8"

  on_intel do
    sha256 "67fb1852a559770cf926436d77a8c438b785404e8dacaa92ea783a6025427a7b"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "b42d1f9fdebcb0a3ce86a38c84a9088548d1e3f787532c7d265ce8f67ca0c45c"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
