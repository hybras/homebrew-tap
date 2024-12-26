cask "webcord" do
  version "4.10.3"

  on_arm do
    sha256 "b15773a3f26293cb8510fe6f2c0322e0c68d5287501088f02badf9258b8700a3"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "48926541ee1fa8a67c60f84f32e73fb9b426b3516b05a716754cb6e21dc2d3d8"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
