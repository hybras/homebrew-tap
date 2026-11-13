cask "kdeconnect@nightly" do
  arch arm: "arm64", intel: "x86_64"

  on_arm do
    version "6936"
    sha256 "b7b875687bb74b71c80d82369295239ebb45d3a0af64764e0864f1edbcebc46a"
  end
  on_intel do
    version "6589"
    sha256 "7a9319a9e1426321b7cc4fe155467a34e698a9766f62fb8c5d1a1387e55bdb19"
  end

  url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
  name "KDE Connect"
  desc "Enabling communication between all your devices"
  homepage "https://kdeconnect.kde.org/"

  livecheck do
    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/"
    regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-#{arch}\.dmg/i)
  end

  depends_on formula: "dbus"
  depends_on macos: :ventura

  app "KDE Connect.app"
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

  caveats "Installation may fail due to nightly build artifacts expiring"
end
