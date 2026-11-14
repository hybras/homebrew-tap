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
    sha256 cellar: :any, arm64_tahoe:  "cb96818a94ab6c85c7871367dc2657b0e9d764af66b9b83175989bceb8d22c79"
    sha256 cellar: :any, x86_64_linux: "bb97cfebd1d9d3c2fb89200b6cae74d94c1b3c8894aaa82e8b289c26b971266b"
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
