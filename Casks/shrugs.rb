cask "shrugs" do
  version "1.2.4-v84"
  sha256 "27deecb1925132a35f4acf489d058f96259320ccf5285bfcaa7c44d391fb9033"

  url "https://shrugs.app/downloads/Shrugs.app-#{version}.zip"
  name "Shrugs"
  desc "Native Slack Client"
  homepage "https://shrugs.app/"

  livecheck do
    url "https://shrugs.app/downloads/appcast.xml"
    strategy :sparkle do |item|
      "#{item.short_version}-v#{item.version}"
    end
  end

  disable! date: "2023-04-01", because: :discontinued

  app "Shrugs.app"

  zap trash: [
    "~/Library/Application Scripts/de.zeezide.swift.see1.shrugs/",
    "~/Library/Containers/de.zeezide.swift.see1.shrugs/",
  ]
end
