cask "kdeconnect-nightly" do
  version "1374"
  sha256 "61966a8d249105a15b14bed20d9b4640a5ace554d1ccd3ec435d29df5dbfaae1"

  url "https://binary-factory.kde.org/view/MacOS/job/kdeconnect-kde_Nightly_macos/#{version}/artifact/kdeconnect-kde-master-#{version}-macos-64-clang.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://binary-factory.kde.org/job/kdeconnect-kde_Nightly_macos/lastStableBuild/artifact/"
    regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-64-clang\.dmg/i)
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
