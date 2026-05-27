cask "kdeconnect@nightly" do
  on_macos do
    arch intel: "x86_64", arm: "arm64"

    version "6210"
    sha256 intel: "f413bbc33526947eec1ec89b1328dba32077191e02bd1eed0386acd7aa5d53dd",
           arm:   "e54a2cb0f1c5fb7091e0ef4e7357c2a309c4af8cb2f86320fc1bd014dfe2a5e9"

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
end
