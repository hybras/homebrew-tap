cask "spotiflyer" do
  version "3.6.2"
  sha256 "00dea19170dd6896bdb20ae05e18aeaca822ea8392a3af399afa43913df3406b"

  url "https://github.com/Shabinder/SpotiFlyer/releases/download/v#{version}/SpotiFlyer-#{version}.dmg"
  name "SpotiFlyer"
  desc "Music Downloader"
  homepage "https://github.com/Shabinder/SpotiFlyer"

  app "SpotiFlyer.app"
end
