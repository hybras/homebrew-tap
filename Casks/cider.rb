cask "cider" do
  version :latest
  sha256 :no_check

  url "https://github.com/ciderapp/Cider/releases/download/macos-beta/Cider.dmg",
    verified: "github.com/ciderapp"
  name "Cider"
  desc "Apple Music Client"
  homepage "https://cider.sh/"

  app "Cider.app"
end
