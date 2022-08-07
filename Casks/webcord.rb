cask "webcord" do
  version "3.6.0"

  if Hardware::CPU.intel?
    sha256 "fdf783f135fa6ac4ad6b91f737ceadd3685f33e9e7e2398af897858f1e05b4c2"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "1ea32f44e6eb9fbbaf24a6e5674820b9b5794c0bd05784c4a74937f48f997a56"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
