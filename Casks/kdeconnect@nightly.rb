cask "kdeconnect@nightly" do
  on_macos do
    arch arm: "arm64", intel: "x86_64"

    version "6510"
    sha256 arm:   "77ef9d6f38e65b24654584181b06d42a23201643358d2c0c2e8dde2524aaa41f",
           intel: "5671f75e069ab74b15c20649600a959f74ee007ae78b3b35c91b0baaf0991d38"

    url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-#{arch}/kdeconnect-kde-master-#{version}-macos-clang-#{arch}.dmg"
    name "KDE Connect"
    desc "Enabling communication between all your devices"
    homepage "https://kdeconnect.kde.org/"

    livecheck do
      url "https://cdn.kde.org/ci-builds/network/kdeconnect-kde/master/macos-x86_64/"
      regex(/href=.*?kdeconnect-kde-master-(\d+)-macos-clang-x86_64\.dmg/i)
    end

    depends_on macos: :ventura
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

  depends_on :macos
end
