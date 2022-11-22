cask "webcord" do
  version "3.9.2"

  on_intel do
    sha256 "05d4217ff97018c2e7ff274856de393079b98ffa8f3c401095ee47eb1602133b"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "54a95f8716b3efc548025c1b113cf48fc955b94497391d7881398ec81a568dcd"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
