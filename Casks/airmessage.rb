cask "airmessage" do
  version "4.0.1"
  sha256 "f7bbc4a68e5e4eccbf46b436e46c423577841d093aa8548e2a783398b213aff4"

  url "https://github.com/airmessage/airmessage-server/releases/download/v#{version}/AirMessage-#{version}.zip",
      verified: "github.com/airmessage"
  name "AirMessage"
  desc "'s message relay server"
  homepage "https://airmessage.org/"

  livecheck do
    url :url
    strategy :git
  end

  app "AirMessage.app"

  uninstall quit: "me.tagavari.airmessageserver"

  zap trash: [
    "~/Library/Application Support/AirMessage",
    "~/Library/Caches/me.tagavari.airmessageserver",
    "~/Library/HTTPStorages/me.tagavari.airmessageserver.binarycookies",
    "~/Library/Preferences/me.tagavari.airmessageserver.plist",
    "~/Library/WebKit/Databases/___IndexedDB/me.tagavari.airmessageserver",
  ]
end
