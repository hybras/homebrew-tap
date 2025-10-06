class Abaddon < Formula
  desc "Alternative Discord client with voice support made with C++ and GTK 3"
  homepage "https://github.com/uowuo/abaddon"
  url "https://github.com/uowuo/abaddon/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a858fca424468a304e3cfc30be9b9982f3fbf078a897cb19a36a0da77fa02d41"
  license "GPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build

  depends_on "adwaita-icon-theme"
  depends_on "gtkmm3"
  depends_on "libhandy"
  depends_on "libsodium"
  depends_on "nlohmann-json"
  depends_on "opus"
  depends_on "spdlog"

  resource "ixwebsocket" do
    url "https://github.com/machinezone/IXWebSocket/archive/bc765e73a31ea5372e36d1b1add036af3218cb17.tar.gz"
    sha256 "9dea909d05e882a540526b15fbdc9764a39deb53810eb86ad797fd8135a02275"
  end

  resource "keychain" do
    url "https://github.com/hrantzsch/keychain/archive/8846e78a1ea72a06a5da17b7f3493dd1c76c0a88.tar.gz"
    sha256 "65a405ad92568ded0069a9959a7676ff48a66acbbe58cba0a022e91014b25f34"
  end

  resource "miniaudio" do
    url "https://github.com/mackron/miniaudio/archive/350784a9467a79d0fa65802132668e5afbcf3777.tar.gz"
    sha256 "28ab6d0d39c32a46d57b52d104046e8b3637bfc51d8bab07ec5ae5415dc8ee52"
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
      r.unpack("subprojects/#{r.name}")
    end
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_predicate bin/"abaddon", :exist?
    assert_predicate bin/"abaddon", :executable?
  end
end
