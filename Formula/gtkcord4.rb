class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.9.tar.gz"
  sha256 "f3af7febb410c50cdf4a2d6db89f139200861ee60ab29b764a43d4dcf208a2e0"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "gtk4" => :build
  depends_on "pkg-config" => :build
  depends_on "libcanberra"

  def install
    deps = %w[
      glib
      pcre2
      pango
      gdk-pixbuf
      graphene
      harfbuzz
      libpng
      libjpeg
      freetype
      cairo
      pixman
      fontconfig
      graphite2
      libxcb
      fribidi
      libtiff
      libxau
      libpthread-stubs
      libxdmcp
      libxrender
      libx11
      libxext
    ]

    deps.each do |dep|
      ENV.prepend_path "PKG_CONFIG_PATH", Formula[dep].opt_lib/"pkgconfig"
    end

    ENV.prepend_path "PKG_CONFIG_PATH", Formula["xorgproto"].opt_share/"pkgconfig"

    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord4", "--help"
  end
end
