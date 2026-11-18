cask "abaddon-app" do
  version "0.2.4"
  sha256 "a74dbd11dadfcb7963a483022f3d3c62ba9a0ea05505230af0a56354d8ab0e10"

  url "https://raw.githubusercontent.com/uowuo/abaddon/v#{version}/res/desktop/icon.svg"
  name "Abaddon"
  desc "App bundle for the abaddon formula, a GTK 3 Discord client"
  homepage "https://github.com/uowuo/abaddon"

  livecheck do
    formula "hybras/tap/abaddon"
  end

  depends_on formula: "hybras/tap/abaddon"
  depends_on formula: "librsvg"
  depends_on :macos
  container type: :naked

  app "Abaddon.app"

  preflight_steps do
    mkdir_p "Abaddon.app/Contents/MacOS"
    symlink "bin/abaddon", "Abaddon.app/Contents/MacOS/abaddon",
            source_base: :formula_opt_prefix, source_formula: "hybras/tap/abaddon"

    mkdir_p "icon.iconset"
    run "{{HOMEBREW_PREFIX}}/opt/librsvg/bin/rsvg-convert",
        args: ["--width=1024", "--height=1024",
               "--output={{staged_path}}/icon.iconset/icon_512x512@2x.png",
               "{{staged_path}}/icon.svg"]
    mkdir_p "Abaddon.app/Contents/Resources"
    run "/usr/bin/iconutil",
        args: ["--convert", "icns", "--output", "{{staged_path}}/Abaddon.app/Contents/Resources/icon.icns",
               "{{staged_path}}/icon.iconset"]

    write_file "Abaddon.app/Contents/Info.plist", <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>abaddon</string>
        <key>CFBundleIconFile</key>
        <string>icon.icns</string>
        <key>CFBundleIdentifier</key>
        <string>io.github.uowuo.abaddon</string>
        <key>CFBundleName</key>
        <string>Abaddon</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>{{version}}</string>
        <key>NSHighResolutionCapable</key>
        <true/>
      </dict>
      </plist>
    XML
  end
end
