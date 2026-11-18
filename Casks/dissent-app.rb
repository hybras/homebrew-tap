cask "dissent-app" do
  version "0.0.41"
  sha256 "f26db286588609d277f8e91a8d36c14f601f069974027c315e477d3a1225310b"

  url "https://raw.githubusercontent.com/diamondburned/dissent/v#{version}/internal/icons/hicolor/scalable/apps/so.libdb.dissent.svg"
  name "Dissent"
  desc "App bundle for the dissent formula, a GTK4 Discord client"
  homepage "https://github.com/diamondburned/dissent"

  livecheck do
    formula "dissent"
  end

  depends_on formula: "dissent"
  depends_on formula: "librsvg"
  depends_on :macos
  container type: :naked

  app "Dissent.app"

  preflight_steps do
    mkdir_p "Dissent.app/Contents/MacOS"
    symlink "bin/dissent", "Dissent.app/Contents/MacOS/dissent",
            source_base: :formula_opt_prefix, source_formula: "dissent"

    mkdir_p "icon.iconset"
    run "{{HOMEBREW_PREFIX}}/opt/librsvg/bin/rsvg-convert",
        args: ["--width=1024", "--height=1024",
               "--output={{staged_path}}/icon.iconset/icon_512x512@2x.png",
               "{{staged_path}}/so.libdb.dissent.svg"]
    mkdir_p "Dissent.app/Contents/Resources"
    run "/usr/bin/iconutil",
        args: ["--convert", "icns", "--output", "{{staged_path}}/Dissent.app/Contents/Resources/icon.icns",
               "{{staged_path}}/icon.iconset"]

    write_file "Dissent.app/Contents/Info.plist", <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>dissent</string>
        <key>CFBundleIconFile</key>
        <string>icon.icns</string>
        <key>CFBundleIdentifier</key>
        <string>so.libdb.dissent</string>
        <key>CFBundleName</key>
        <string>Dissent</string>
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
