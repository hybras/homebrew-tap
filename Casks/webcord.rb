cask "webcord" do
  version "4.8.0"

  on_arm do
    sha256 "5e7f599f284b0d8cb6c967af5485d057d86eaaef352dce02499d1fb5abce4472"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "0a504b5b4e0a8cd79804d180f37681ce82a0930af80efdb1d35d3610adad3f5b"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
