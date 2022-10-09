cask "webcord" do
  version "3.8.6"

  on_intel do
    sha256 "e9faab79e0313bf6fa4e5a3c3f367cb5d19fe2698a810d51e8b7823db82616c2"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "54e3bba856af39e9f1ae94b5d86f84658b42a7aa7ad7fd3beee69f73f04e30e4"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
