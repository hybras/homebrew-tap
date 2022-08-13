cask "webcord" do
  version "3.7.1"

  if Hardware::CPU.intel?
    sha256 "50ad50c626ced7d9cc2ccf214691a953fc23856515ff40f5288eeb86eac81781"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "ff018566f8a5410c1b78e77ae015f77644ee866062c5079ab6440ffa03b35547"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
