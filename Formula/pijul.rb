class Pijul < Formula
  desc "A sound and fast distributed version control system"
  homepage "https://pijul.com"
  license "GPL-2.0-or-later"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-alpha.57.crate"
  sha256 "d6dd02c47ffb436f8645939d8e172bd07d7f908cf7ea49f2aba6e23f1e58821a"

  depends_on "rust" => :build
  depends_on "llvm" => :build
  depends_on "libsodium" => :build
  depends_on "openssl" => :build
  depends_on "xxhash" => :build
  depends_on "zstd" => :build

  def install
    system "tar", "xf", "pijul-#{version}.crate"
    cd "pijul-#{version}" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system "pijul"
  end
end
