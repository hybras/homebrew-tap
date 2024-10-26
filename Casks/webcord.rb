cask "webcord" do
  version "4.10.2"

  on_arm do
    sha256 "0dff37774cc3c6726739466200ac3051a10e4c49046c8ff1a3e9a771f6204934"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "fae10b02d0e3d81ff9bad76597260f46512b15f61597ceea0737da2fd7c5c6dc"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
