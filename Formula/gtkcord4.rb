class Gtkcord4 < Formula
  desc "Gtk4 Discord client"
  homepage "https://github.com/diamondburned/gtkcord4"
  url "https://github.com/diamondburned/gtkcord4/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "6a043898635cf3d74652f564afd97e271ed77a56397bbe9fc607eb4ffbdc6036"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "gobject-introspection" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk4" => :build
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

    for dep in deps do
      ENV.prepend_path "PKG_CONFIG_PATH", Formula[dep].opt_lib/"pkgconfig"
    end

    ENV.prepend_path "PKG_CONFIG_PATH", Formula["xorgproto"].opt_share/"pkgconfig"

    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system bin.to_s/"gtkcord4", "--help"
  end
end
