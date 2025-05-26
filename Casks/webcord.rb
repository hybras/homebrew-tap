cask "webcord" do
  version "4.11.0"

  on_arm do
    sha256 "5dfc316ccf887e6767e5dceb3ce5b6e22700370e15b693da21b54357be5a8a93"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "2712d8016c1eaf4110067ee6cb6a3d41d6eb7aa59f300696f4c322184c903cd6"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
