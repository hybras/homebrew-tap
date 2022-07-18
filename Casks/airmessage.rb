cask "airmessage" do

  version "4.0.0"

  sha256 "e86329a2a5ce0d4b816341f37a1824fca0bcb2233f94eb27def2116a226f928c"
  
  url "https://github.com/airmessage/airmessage-server/releases/download/v#{version}/AirMessage-v#{version}.zip",
      verified: "github.com/airmessage"
  name "AirMessage"
  desc "AirMessage's message relay server"
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
