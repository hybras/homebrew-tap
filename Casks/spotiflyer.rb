cask "spotiflyer" do
  version "3.6.3"
  sha256 "787970c64acd30865d1e8649fe404dc5841d7d87910f1d42d1862fd21703d2dd"

  url "https://github.com/Shabinder/SpotiFlyer/releases/download/v#{version}/SpotiFlyer-#{version}.dmg"
  name "SpotiFlyer"
  desc "Music Downloader"
  homepage "https://github.com/Shabinder/SpotiFlyer"

  app "SpotiFlyer.app"
end
