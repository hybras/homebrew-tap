cask "webcord" do
  version "4.7.0"

  on_arm do
    sha256 "bf6826388b5f46c6715de7dca6f4715e413a4df70ed052e987e28117ddefb0b8"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "9fc1730e23b7f471070cd425cec5a7c46c09ee42b93b43ee0a3f2460091cea8f"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
