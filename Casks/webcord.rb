cask "webcord" do
  version "4.10.0"

  on_arm do
    sha256 "64be0c1c130aea1ab206b626f3a85c857429203b25ba2bab6ef48823bad864e0"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "4475691f952d455ca8376e008fecdcb95320295c86ea3ba62a60c2640f41d591"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
