cask "voxa" do
  version "0.6.8"
  sha256 "310213d106ca9406b588d79572a18f897ee39196f52b736e6a17cf9c99ef91c1"

  url "https://github.com/voxa-org/Voxa/releases/download/v#{version}/Voxa.#{version}.dmg",
      verified: "github.com/voxa-org/"
  name "Voxa"
  desc "Discord client"
  homepage "https://voxa.peril.lol/"

  # depends_on macos: ""

  app "Voxa.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: ""
end
