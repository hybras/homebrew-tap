# [R] Minimum notability requirements not reached, more details from https://github.com/Homebrew/homebrew-cask/pull/116236

cask "airmessage" do
  version "4.1.4"
  sha256 "053dd2c33354f3e183088b83073ff9bd25e806824dbc1ccfed2b13239e23420d"

  url "https://github.com/airmessage/airmessage-server/releases/download/v#{version}/AirMessage-#{version}.zip",
      verified: "github.com/airmessage/"
  name "AirMessage"
  desc "IMessage relay server"
  homepage "https://airmessage.org/"

  auto_updates true

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
