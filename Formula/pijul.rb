class Pijul < Formula
  desc "Sound and fast distributed version control system"
  homepage "https://pijul.org"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.9.crate"
  sha256 "c51a43abf66dfdd63393f9d7e426129a769c7345d64d451a30be9399733062d2"
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
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"pijul", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system bin/"pijul", "add", "haunted", "house"
    assert_equal "haunted\nhouse", shell_output("#{bin}/pijul list").strip
  end
end
