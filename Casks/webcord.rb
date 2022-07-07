cask "webcord" do
  version "3.4.0"

  if Hardware::CPU.intel?
    sha256 "d8277caccbdc97e473142e1183b26eb97e380600164747b4babf3c6f376f67d7"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "d3b40853bf1efd0a1597ac5612a600e145c962070ff5804a7e9e1fb75a414cc3"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
