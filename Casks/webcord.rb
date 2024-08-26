cask "webcord" do
  version "4.10.1"

  on_arm do
    sha256 "73b523c34adb0853690a6c34cb9ca8d01a95b9bbe860f09d1d0886ab6695b8e4"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "18f952b5aec56b64f20707cd6b92948c1fa947b2819c1b56a7aa98f2b1b7fa24"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
