cask "kdeconnect-nightly" do
  version "1629"
  sha256 "f680a05399fcf8ba99ace0c104cd95ecb6bee80b43cabcb3d640e93b6d9404e3"

  url "https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/#{version}/artifact/kdeconnect-kde-master-#{version}-macos-64-clang.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://binary-factory.kde.org/job/kdeconnect-kde_Nightly_macos/lastStableBuild/artifact/"
    regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-64-clang\.dmg/i)
  end

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

  caveats "KDE Connect needs dbus. Install it with `brew install dbus`"
end
