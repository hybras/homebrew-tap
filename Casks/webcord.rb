cask "webcord" do
  version "4.10.5"

  on_arm do
    sha256 "0d2b4f688bf4164ebdc5ac6fe92eb78e742fca549d1587c1bca94db3c39665de"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "ad6d3e599855d98c6674b913f435e7f2a1561a51afac2b6a682ab54aa4d12e29"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
