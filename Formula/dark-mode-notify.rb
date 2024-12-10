class DarkModeNotify < Formula
  desc "Run a script whenever dark mode changes in macOS"
  homepage "https://github.com/bouk/dark-mode-notify"
  version "0.1.0"
  license "MIT"
  head "https://github.com/bouk/dark-mode-notify.git", branch: "main"

  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/#{name}"
  end

  def post_install
    etc.mkpath
    touch etc/"onInterfaceThemeChange"
  end

  test do
    system "false"
  end

  service do
    run [opt_bin/"dark-mode-notify", etc/"onInterfaceThemeChange"]
    keep_alive true
    log_path var/"log/dark-mode-notify.log"
    error_log_path var/"log/dark-mode-notify.log"
  end
end
