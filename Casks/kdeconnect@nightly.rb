cask "kdeconnect@nightly" do
  on_macos do
    arch intel: "x86_64", arm: "arm64"

    version "5284"
    sha256 intel: "e6b830b6a98cb21872f02e60712bb04d36fcfa60ac29eb53e4c66f29e74987b3",
           arm:   "1eeb251cf50ca4f82d72e52b7d13e38a3dd323465763b0eab5615eff96ddf1f5"

    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
    name "KDE Connect"
    desc "Enabling communication between all your devices"
    homepage "https://kdeconnect.kde.org/"

    livecheck do
      url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/"
      regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-x86_64\.dmg/i)
    end

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
