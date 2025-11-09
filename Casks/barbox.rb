cask "barbox" do
  version "2.3.0"
  sha256 "c563cf1b84b267230e75539373609410cb8d059cfd0789e1a6926e2eb4bc6519"

  url "https://github.com/MuhammedKpln/barbox/releases/download/#{version}/BarBox.dmg",
      verified: "github.com/MuhammedKpln/barbox/"
  name "BarBox"
  desc "Access disposable emails from the menu bar"
  homepage "https://muhammedkpln.github.io/barbox/"

  deprecate! date: "2024-08-15", because: :unmaintained

  app "BarBox.app"

  zap trash: [
    "~/Library/Application Scripts/com.muhammedkpln.barbox/",
    "~/Library/Containers/com.muhammedkpln.barbox/",
  ]
end
