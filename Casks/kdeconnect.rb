cask "kdeconnect" do
  version "22.04.3-1010"
  sha256 "7652d81ab1ed976658025445de99baae81ccffc57d6a366e66cb9e26077c10ca"

  url "https://binary-factory.kde.org/job/kdeconnect-kde_Release_macos/#{version.match(/\d+(?:[.-](\d+))+/)[1]}/artifact/kdeconnect-kde-#{version}-macos-64-clang.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://binary-factory.kde.org/job/kdeconnect-kde_Release_macos/lastSuccessfulBuild/artifact/"
    regex(/href=.*?kdeconnect-kde[._-]v?(\d+(?:[.-]\d+)+)-macos-64-clang\.dmg/i)
  end

  app "kdeconnect-indicator.app", target: "KDE Connect.app"
  binary "#{appdir}/KDE Connect.app/Contents/MacOS/kdeconnect-cli"

  uninstall quit: "org.kde.kdeconnect"

  zap trash: [
    "~/Library/Application Support/kpeoplevcard",
    "~/Library/Caches/kdeconnect.sms",
    "~/Library/Preferences/kdeconnect",
    "~/Library/Preferences/kdeconnect_runcommand",
    "~/Library/Preferences/kdeconnect_sendnotifications",
    "~/Library/Preferences/kdeconnect_share",
    "~/Library/Preferences/org.kde.kdeconnect.plist",
  ]

  caveats "KDE Connect needs dbus. Install it with `brew install dbus`"
end
