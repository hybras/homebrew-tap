cask "airmessage" do
  version "4.1.3"
  sha256 "693bcb5fad3aae4b0d51aa77dba2cb181cf4ddca3855bb5d7acc55f0f08e7be2"

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
