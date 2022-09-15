cask "webcord" do
  version "3.8.3"

  on_intel do
    sha256 "e8a44949daf4b6426a0530daccabd80af0d8c6489e3893e1302205d00066e4e8"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "7bc343562f165d05f3125e51a87b971a144bd7c6733b51f07685992b91fca3a8"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
