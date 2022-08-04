cask "airmessage" do
  version "4.1.0"
  sha256 "513647d55e8354785ec3bb0623c79fd6160d25755f20fa97ac75e85a707726da"

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
