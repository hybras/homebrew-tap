cask "kdeconnect" do
  version "21.12.1-818"
  sha256 "3bbc496ee2d93f126ed3854458d361e0214b3099f1a7f9b3658e8906a2b2968d"

  url "https://binary-factory.kde.org/job/kdeconnect-kde_Release_macos/#{version.scan(/\d+(?:[.-](\d+))+/)[0][0]}/artifact/kdeconnect-kde-#{version}-macos-64-clang.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://binary-factory.kde.org/job/kdeconnect-kde_Release_macos/lastSuccessfulBuild/artifact/"
    regex(/href=.*?kdeconnect-kde[._-]v?(\d+(?:[.-]\d+)+)-macos-64-clang\.dmg/i)
  end

  app "kdeconnect-indicator.app", target: "KDE Connect.app"

  uninstall quit: "org.kde.kdeconnect"

  zap trash: [
    "~/Library/Application Support/kpeoplevcard",
    "~/Library/Preferences/kdeconnect",
    "~/Library/Preferences/kdeconnect_runcommand",
    "~/Library/Preferences/kdeconnect_sendnotifications",
    "~/Library/Preferences/kdeconnect_share",
    "~/Library/Preferences/org.kde.kdeconnect.plist",
  ]
end
