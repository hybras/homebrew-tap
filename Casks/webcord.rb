cask "webcord" do
  version "3.5.2"

  if Hardware::CPU.intel?
    sha256 "4aefd56c91850583349377d7efdea2fbec66b8fbf30607580c3243a0444d56e8"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "478b8074f1a8ca39a1b7bd6a3f0a577c7e88396bc5a942488defc6219bd7f6e7"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
