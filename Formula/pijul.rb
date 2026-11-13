class Pijul < Formula
  desc "Sound and fast distributed version control system"
  homepage "https://pijul.org"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.12.crate"
  sha256 "cede03df443e55f8c47c7f213a67c37f8f8d7ceeff3578e9ba9a1e0df63191e2"
  license "GPL-2.0-or-later"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+(?:-beta\.\d+)?)$/i)
  end

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 1
    sha256 cellar: :any, arm64_tahoe:  "1edd1d45c7d7d9d7ab6737398a50c2a9b52e8de5c9030a4f2a04d031e3b43c95"
    sha256 cellar: :any, x86_64_linux: "641d064be2f555b4324f5acb2ee3a03d038ebf99253b5286a668ed6e3bd5232b"
  end

  depends_on "llvm" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "xxhash" => :build
  depends_on "zstd" => :build
  depends_on "libsodium"
  depends_on "openssl"

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
