cask "webcord" do
  version "4.1.1"

  on_intel do
    sha256 "a95addc83a9c0add447600266bc946c58b61095d1626c2fc3b0f2cd0202a0f8c"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "d8d69dde08175d1269e2e07ee8acee988638fcd5c56bcf57ec038c2dd7821979"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
