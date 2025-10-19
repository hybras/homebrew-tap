cask "kdeconnect@nightly" do
  on_macos do
    arch intel: "x86_64", arm: "arm64"

    version "5371"
    sha256 intel: "f3f82c00b7e7ddaa6522344fd585c1755685799677c65fbd49c241449ce96f49",
           arm:   "15f0d93150b8e7d89d6cbf5f332a548565206dada0572e1d1637c5c7dd891b91"

    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
    name "KDE Connect"
    desc "Enabling communication between all your devices"
    homepage "https://kdeconnect.kde.org/"

    livecheck do
      url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/"
      regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-x86_64\.dmg/i)
    end

    depends_on macos: ">= :monterey"
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
