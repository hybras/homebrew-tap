cask "webcord" do
  version "4.11.1"

  on_arm do
    sha256 "192bf1703b3ee6a52f082a01ff577df2902db53b362bd73323fa81bcb46f6e85"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "e2ea8a201ddf8373bb20976cea894be5d27e25f27d758bce07debfd0f30d984a"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
