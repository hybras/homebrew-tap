cask "webcord" do
  version "4.9.1"

  on_arm do
    sha256 "a6733e5789564c8ad76e69bc998c9f2143b0a95c25c5fc4cb17b2ebba19b9a95"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "52bc878366f37dcfb2c94b61d711ef6b8441bf49d3a595fd5814c7da6c9e83b3"

    url "https://github.com/SpacingBat3/WebCord/releases/download/v#{version}/WebCord-#{version}-x64.dmg"
  end

  name "WebCord"
  desc "Discord and Fosscord web-based client made with the :electron:"
  homepage "https://github.com/SpacingBat3/WebCord"

  app "WebCord.app"
end
