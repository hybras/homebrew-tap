cask "webcord" do
  version "4.5.0"

  on_arm do
    sha256 "04e20a7392273d6fe9ddbd461695ab6373eb4b457c35e354454174b89d040471"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f943d53b83b2e576155161226676af5e510d695b632ca985aec8a27ff517603b"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
