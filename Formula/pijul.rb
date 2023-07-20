class Pijul < Formula
  desc "Sound and fast distributed version control system"
  homepage "https://pijul.com"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.2.crate"
  sha256 "9e0870af813cdab0a8f8f3687f545714fc0f6aeee47a2447bea3bf3ce6706dc5"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://lib.rs/crates/pijul/versions"
    regex(%r{href=["']?https://crates.io/crates/pijul/v?(\d+(?:\.\d+)+(?:-(?:alpha|beta))?(?:[._-]\d+)?)}i)
  end

  depends_on "libsodium" => :build
  depends_on "llvm" => :build
  depends_on "openssl" => :build
  depends_on "rust" => :build
  depends_on "xxhash" => :build
  depends_on "zstd" => :build

  def install
    system "tar", "xf", "pijul-#{version}.crate"
    cd "pijul-#{version}" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system "#{bin}/pijul"
  end
end
