cask "webcord" do
  version "4.6.0"

  on_arm do
    sha256 "8d4972983bfd8c14e5433759dfb29c37c9fafd0ccc3748103b140c710c0f8440"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "a67217aacd0bac4d256c669e1bac5ee01008780fd82d8146b84b1251b120ff32"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
