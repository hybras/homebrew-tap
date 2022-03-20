cask "spotiflyer" do
  version "3.6.1"
  sha256 "0875bb88ffb0e0fbc0858f87dd92eca799c534bfb66507640e7f13e83dec4632"

  url "https://github.com/Shabinder/SpotiFlyer/releases/download/v#{version}/SpotiFlyer-#{version}.dmg"
  name "SpotiFlyer"
  desc "Music Downloader"
  homepage "https://github.com/Shabinder/SpotiFlyer"

  app "SpotiFlyer.app"
end
