class Pijul < Formula
  desc "Sound and fast distributed version control system"
  homepage "https://pijul.org"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.26.crate"
  sha256 "529b381b89ff47db636e3361261da58a645869b07bb3a4a4839121c8944e2b97"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)$/i)
  end

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    sha256 cellar: :any, arm64_tahoe:  "916d8178e3e4b6a39b2217f13f8f9e342fd399ff8294b973cc79b08bff936265"
    sha256 cellar: :any, x86_64_linux: "6c268dcbb34ba1ce8808203bc4cd47a532ab6cbceed09f9aa4c05c74a149783e"
  end

  depends_on "llvm" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "xxhash" => :build
  depends_on "zstd" => :build
  depends_on "libsodium"
  depends_on "openssl@4"

  on_linux do
    depends_on "dbus"
    depends_on "zlib-ng-compat"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"pijul", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system bin/"pijul", "add", "haunted", "house"
    assert_equal "haunted\nhouse", shell_output("#{bin}/pijul list").strip
  end
end
