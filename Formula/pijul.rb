class Pijul < Formula
  desc "Sound and fast distributed version control system"
  homepage "https://pijul.org"
  url "https://static.crates.io/crates/pijul/pijul-1.0.0-beta.7.crate"
  sha256 "3678fa50d92ff68a5907a9b4208e9ad15cb71411d41b2925702d6ff3d5f93250"
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
    system bin/"pijul", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system bin/"pijul", "add", "haunted", "house"
    assert_equal "haunted\nhouse", shell_output("#{bin}/pijul list").strip
  end
end
