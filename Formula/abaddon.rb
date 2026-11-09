class Abaddon < Formula
  desc "Alternative Discord client with voice support made with C++ and GTK 3"
  homepage "https://github.com/uowuo/abaddon"
  url "https://github.com/uowuo/abaddon/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "68cb3ca04eaf26dccf7d7750a65df8cf23819c9d501b25808a364b2915c360cf"
  license "GPL-3.0-only"
  head "https://github.com/hybras/abaddon.git", branch: "fix/macos-resource-fallback"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    sha256 cellar: :any, arm64_tahoe: "70bf28d53f5376f9cba3bff28867e6fac8571d5ea6b19e1e3c83330e3eb40bf4"
  end

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

  depends_on "adwaita-icon-theme"
  depends_on "at-spi2-core"
  depends_on "atkmm@2.28"
  depends_on "cairo"
  depends_on "cairomm@1.14"
  depends_on "fmt"
  depends_on "fontconfig"
  depends_on "freetype"
  depends_on "gdk-pixbuf"
  depends_on "glib"
  depends_on "glibmm@2.66"
  depends_on "gtk+3"
  depends_on "gtkmm3"
  depends_on "harfbuzz"
  depends_on "libhandy"
  depends_on "libsigc++@2"
  depends_on "libsodium"
  depends_on :macos
  depends_on "nlohmann-json"
  depends_on "openssl@3"
  depends_on "opus"
  depends_on "pango"
  depends_on "pangomm@2.46"
  depends_on "spdlog"

  resource "ixwebsocket" do
    url "https://github.com/machinezone/IXWebSocket/archive/bc765e73a31ea5372e36d1b1add036af3218cb17.tar.gz"
    sha256 "9dea909d05e882a540526b15fbdc9764a39deb53810eb86ad797fd8135a02275"
  end

  resource "keychain" do
    url "https://github.com/hrantzsch/keychain/archive/8846e78a1ea72a06a5da17b7f3493dd1c76c0a88.tar.gz"
    sha256 "65a405ad92568ded0069a9959a7676ff48a66acbbe58cba0a022e91014b25f34"
  end

  resource "libdave" do
    url "https://github.com/discord/libdave/archive/52cd56dc550f447fb354b3a06c9e2d2e2a4309c6.tar.gz"
    sha256 "3564e0d26fa143bbbd0659bd92b50fb89db2a9f17e0e8edb95d5861b046f8ffd"
  end

  resource "miniaudio" do
    url "https://github.com/mackron/miniaudio/archive/9634bedb5b5a2ca38c1ee7108a9358a4e233f14d.tar.gz"
    sha256 "1a3a79b80fc6f0b0cc155e28b954a598e0ddfa2db64e2afa8466be88c476fa55"
  end

  resource "mlspp" do
    url "https://github.com/cisco/mlspp/archive/1cc50a124a3bc4e143a787ec934280dc70c1034d.tar.gz"
    sha256 "7a9d6318627e548903bc65c3dc5a4de4a90290983efea9a49af8561ed3f999f5"
  end

  resource "qrcodegen" do
    url "https://github.com/nayuki/QR-Code-generator/archive/22fac31bdf81da68730c177c0e931c93234d2a30.tar.gz"
    sha256 "218e3e96ded7880d05f47c668aad6541a08e63303ac4d783720389087da6f4ed"
  end

  resource "rnnoise" do
    url "https://github.com/xiph/rnnoise/archive/1cbdbcf1283499bbb2230a6b0f126eb9b236defd.tar.gz"
    sha256 "68c7ab4e408426088603e19955e746bb2a412d84bb121b6f39834c60fc8068b7"
  end

  def install
    resources.each do |r|
      r.stage buildpath/"subprojects"/r.name
    end
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_path_exists bin/"abaddon"
    assert_predicate bin/"abaddon", :executable?
  end
end
