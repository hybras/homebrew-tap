cask "displaylink-manager" do
  version "1.7.1"
  sha256 "32e2c0dce4888895e59e50181f0e15118d8f066abb4568e994878ce0294d422c"

  url "https://www.synaptics.com/sites/default/files/exe_files/2022-07/DisplayLink%20Manager%20Graphics%20Connectivity#{version}-EXE.pkg"
  name "DisplayLink Manager"
  desc ""
  homepage "https://www.synaptics.com/products/displaylink-graphics/downloads/macos"

  pkg "DisplayLink Manager Graphics Connectivity#{version}-EXE.pkg"

  uninstall pkgutil: "com.displaylink.displaylinkmanagerapp"
end
