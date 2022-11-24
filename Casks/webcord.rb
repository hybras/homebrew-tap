cask "webcord" do
  version "3.10.0"

  on_intel do
    sha256 "017acd7602943620178319c2a264d9009969a9aa439a7bf1132bc375e022ee70"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end
  on_arm do
    sha256 "928d880c119be9313664944f8d038863f41e47a770c6d399efa427352f9d1acb"
    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
