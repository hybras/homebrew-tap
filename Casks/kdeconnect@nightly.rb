cask "kdeconnect@nightly" do
  on_macos do
    arch intel: "x86_64", arm: "arm64"

    version "6171"
    sha256 intel: "d86e3fadca6331660abdbf81ea5d5b7e186ea057ea76a090871a4329e1b4631b",
           arm:   "06af6edbf7107fb9beeae6a2e88e9118ef05a18c43af854ce1bd35b1597f2d37"

    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
    name "KDE Connect"
    desc "Enabling communication between all your devices"
    homepage "https://kdeconnect.kde.org/"

    livecheck do
      url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/"
      regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-x86_64\.dmg/i)
    end

    depends_on macos: ">= :ventura"
    depends_on formula: "dbus"

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
end
