cask "kdeconnect-nightly" do
  version "2008"
  sha256 "d6ab2a32b9c3c6a87161a477d324b635ff15a66ff86e1ad8d375d97f75128978"

  url "https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/#{version}/artifact/kdeconnect-kde-master-#{version}-macos-clang-x86_64.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://binary-factory.kde.org/job/kdeconnect-kde_Nightly_macos/lastStableBuild/artifact/"
    regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-x86_64\.dmg/i)
  end

  depends_on formula: "dbus"

  app "kdeconnect-indicator.app", target: "KDE Connect.app"
  binary "#{appdir}/KDE Connect.app/Contents/MacOS/kdeconnect-cli"
  binary "#{appdir}/KDE Connect.app/Contents/MacOS/kdeconnect-sms"

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
end
