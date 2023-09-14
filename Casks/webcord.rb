cask "webcord" do
  version "4.4.0"

  on_arm do
    sha256 "36217bce089cd83fbeb0113dcd38682447c60244bac9dd18ceb88af0e4a90b8e"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "cfde523040257e7d0406045af88f9042d01549f4830ec0fd63698a4dbc074105"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
