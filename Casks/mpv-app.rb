cask "mpv-app" do
  arch arm: "arm", intel: "intel"

  # Upstream builds against each macOS version's SDK and sets the binary's minimum to match.
  macos = "15"
  version "0.42.0"

  on_arm do
    on_sequoia :or_older do
      sha256 "be1b8d2445e6880860869c080b8710dee189721f1fa4689840db6a2c10d7be69"
    end
    # The macOS 27 build requires macOS 27.2, which `depends_on` can't express.
    on_tahoe :or_newer do
      macos = "26"
      sha256 "81bffbda01d69eec566ee3f576a2d0089447ba4b21dece3954f08109d5435ce1"
    end
  end
  on_intel do
    sha256 "2d2f34350ff844b6014c35f21ca142937275e19c0c673150a8564fcd2f3bfa14"
  end

  url "https://github.com/mpv-player/mpv/releases/download/v#{version}/mpv-v#{version}-macos-#{macos}-#{arch}.zip"
  name "mpv"
  desc "Media player based on MPlayer and mplayer2"
  homepage "https://mpv.io/"

  conflicts_with cask: "stolendata-mpv"
  depends_on macos: :sequoia

  app "mpv.app"
  binary "#{appdir}/mpv.app/Contents/MacOS/mpv"

  zap trash: [
    "~/.config/mpv",
    "~/Library/Logs/mpv.log",
    "~/Library/Preferences/io.mpv.plist",
    "~/Library/Preferences/mpv.plist",
  ]

  caveats <<~EOS
    mpv's official builds are ad-hoc signed, so Gatekeeper blocks them on first launch.
    Allow mpv in System Settings > Privacy & Security, or run:
      xattr -dr com.apple.quarantine #{appdir}/mpv.app
  EOS
end
