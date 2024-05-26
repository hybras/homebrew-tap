cask "webcord" do
  version "4.9.2"

  on_arm do
    sha256 "fa07d664b707917217f98de1667fb60b794d4a57021ae4bfaf84682fcd031c52"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "1312dfacf3378cec1055be62dddfd248ba5f171a1e50cdd8b54cda94ee234a0e"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
