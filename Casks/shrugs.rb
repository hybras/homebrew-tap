cask "shrugs" do
  version "1.2.2-v74"
  sha256 "7d175210fb33681ee947a5556fe0b2b59b23af9043b5e74bb0e194621f59ea75"

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

  app "Shrugs.app"

  zap trash: [
    "~/Library/Application Scripts/de.zeezide.swift.see1.shrugs/",
    "~/Library/Containers/de.zeezide.swift.see1.shrugs/",
  ]
end
