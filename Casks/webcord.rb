cask "webcord" do
  version "4.2.0"

  on_arm do
    sha256 "d7b3c8e3b714a322366ea9701e06ae0e496ab9b7cb307674d837779f8bc0c5ed"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "492edcdd3cf9ef635b264575fdf0fb0e874d175c0bd778598b247ca2d8e070c3"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
