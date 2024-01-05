cask "webcord" do
  version "4.6.1"

  on_arm do
    sha256 "f60adb59773b227541e8e871a0cc91e25c1f2658afd29aaf8a41bc44c4f3c85c"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "240bf855cd5b169d526f6c2bd944233789ce2453e01a678d20760b86ec918aa9"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
