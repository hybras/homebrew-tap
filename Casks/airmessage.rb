cask "airmessage" do
  version "4.1.1"
  sha256 "bd3fcd559333fe61ec405da4f1477e402920c537c9cee90ef10179c4572edbff"

  url "https://github.com/airmessage/airmessage-server/releases/download/v#{version}/AirMessage-#{version}.zip",
      verified: "github.com/airmessage"
  name "AirMessage"
  desc "IMessage relay server"
  homepage "https://airmessage.org/"

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
