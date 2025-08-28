cask "arna" do
  version "2.1.0"
  sha256 "81c7d29f4ad99f34062d028cf22e828314ac371aa594b36ba9bef3db5243d580"

  url "https://github.com/MahanRahmati/translate/releases/download/v#{version}/arna_translate_macOS.zip"
  name "Arna"
  desc "Google Translate App"
  homepage "https://github.com/MahanRahmati/translate"

  disable! date: "2024-07-12", because: :unmaintained

  app "Translate.app", target: "Arna Translate.app"
end
