cask "webcord" do
  version "3.5.1"

  if Hardware::CPU.intel?
    sha256 "350492f4ef13627b869e613c327695c1f9234a07a66540fbd168c9a13a77df9a"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "89f769e1faf464b01f60520f3b304e5e9c342c114de5d79f0da890d08c766ef5"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
