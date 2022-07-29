cask "arna" do
  version "2.0.5"
  sha256 "7b87e27078bdeee11704a89fb52bb7eed056128b26e0a95a23678e208943983a"

  url "https://github.com/MahanRahmati/translate/releases/download/v#{version}/arna_translate_macOS.zip"
  name "Arna"
  desc "Google Translate App"
  homepage "https://github.com/MahanRahmati/translate"

  app "Translate.app", target: "Arna Translate.app"
end
