cask "cider" do
  version "1.5.6"
  sha256 "4dadcda0a36d7712c13a7c9430fd814037d34b35c38760d01920299366885047"

  url "https://github.com/ciderapp/cider-releases/releases/download/v#{version}/Cider-#{version}-universal.dmg",
    verified: "github.com/ciderapp"
  name "Cider"
  desc "Apple Music Client"
  homepage "https://cider.sh/"

  app "Cider.app"
end
