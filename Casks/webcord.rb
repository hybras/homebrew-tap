cask "webcord" do
  version "3.3.0"

  if Hardware::CPU.intel? then
    sha256 "33e0e294fc788ac7b98ffb4294b8f851f9c540943c1913f516506ff3def967cc"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  else
    sha256 "668d167819b69bffd16d6c0ffb94fd08e9b3baf64c4dcec4715a795299a0bf2f"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  name "WebCord"
  desc "A Discord and Fosscord web-based client made with the :electron:."
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
