cask "displaylink-manager" do
  version "1.9"
  sha256 "cd7f7c7c313b0699bfa187f7112a45e5c5441264447b381569839318676208aa"

  url "https://www.synaptics.com/sites/default/files/exe_files/2023-07/DisplayLink%20Manager%20Graphics%20Connectivity#{version}-EXE.pkg"
  name "DisplayLink Manager"
  desc "Drivers for DisplayLink dock, adapter or monitor"
  homepage "https://www.synaptics.com/products/displaylink-graphics/downloads/macos"

  pkg "DisplayLink Manager Graphics Connectivity#{version}-EXE.pkg"

  livecheck do
    # TODO
    skip "No version information available"
  end

  uninstall pkgutil: "com.displaylink.displaylinkmanagerapp"
end
