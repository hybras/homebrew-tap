cask "bartender" do
  on_ventura :or_older do
    version "4.2.25"
    sha256 "f1a2ecf300cf56aaf531324cba646442026cb0b63b4f90f46a1aee5b0804688a"
  end
  on_sonoma :or_newer do
    version "5.0.49"
    sha256 "7f91ad8d0aee86f5c784096d0b3d732f518356d3e1b2b3b9db2e196a0740574b"
  end

  v = version.to_s.split(".")

  url "https://macbartender.com/B2/updates/#{v[0]}-#{v[1]}-#{v[2]}/Bartender%20#{v[0]}.zip"
  name "Bartender"
  desc "Menu bar icon organiser"
  homepage "https://www.macbartender.com/"

  livecheck do
    skip "Pinned version"
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Bartender #{v[0]}.app"

  uninstall launchctl: "com.surteesstudios.Bartender.BartenderInstallHelper",
            quit:      "com.surteesstudios.Bartender",
            delete:    [
              "/Library/Audio/Plug-Ins/HAL/BartenderAudioPlugIn.plugin",
              "/Library/PrivilegedHelperTools/com.surteesstudios.Bartender.BartenderInstallHelper",
              "/Library/ScriptingAdditions/BartenderHelper.osax",
              "/System/Library/ScriptingAdditions/BartenderSystemHelper.osax",
            ]

  zap trash: [
    "~/Library/Caches/com.surteesstudios.Bartender",
    "~/Library/Cookies/com.surteesstudios.Bartender.binarycookies",
    "~/Library/Preferences/com.surteesstudios.Bartender.plist",
  ]
end
