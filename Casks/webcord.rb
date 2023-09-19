cask "webcord" do
  version "4.4.1"

  on_arm do
    sha256 "47699787aeb3af0267c30691d2d031d9989376a301e3722976cda0ee2c5fddcf"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "f16a544be056642d418ef99435d27e0531583bc3c422e69a597e6925d163cfeb"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
