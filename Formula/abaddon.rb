class Abaddon < Formula
  desc "Alternative Discord client with voice support made with C++ and GTK 3"
  homepage "https://github.com/uowuo/abaddon"
  url "https://github.com/uowuo/abaddon/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "a858fca424468a304e3cfc30be9b9982f3fbf078a897cb19a36a0da77fa02d41"
  license "GPL-3.0-only"

  depends_on "cmake" => :build

  depends_on "adwaita-icon-theme"
  depends_on "gtkmm3"
  depends_on "libhandy"
  depends_on "libsodium"
  depends_on "nlohmann-json"
  depends_on "opus"
  depends_on "spdlog"

  resource "ixwebsocket" do
    url "https://github.com/machinezone/IXWebSocket/archive/bc765e73a31ea5372e36d1b1add036af3218cb17.tar.gz"
    sha256 ""
  end

  resource "keychain" do
    url "https://github.com/hrantzsch/keychain/archive/8846e78a1ea72a06a5da17b7f3493dd1c76c0a88.tar.gz"
    sha256 ""
  end

  resource "miniaudio" do
    url "https://github.com/mackron/miniaudio/archive/350784a9467a79d0fa65802132668e5afbcf3777.tar.gz"
    sha256 ""
  end

  resource "qrcodegen" do
    url "https://github.com/nayuki/QR-Code-generator/archive/22fac31bdf81da68730c177c0e931c93234d2a30.tar.gz"
    sha256 ""
  end

  resource "rnnoise" do
    url "https://github.com/xiph/rnnoise/archive/1cbdbcf1283499bbb2230a6b0f126eb9b236defd.tar.gz"
    sha256 ""
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
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test abaddon`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "false"
  end
end
