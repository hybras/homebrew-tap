class Libreddit < Formula
  desc "Alternative private front-end to Reddit"
  homepage "https://github.com/libreddit/libreddit/issues/840"
  url "https://github.com/libreddit/libreddit/archive/refs/tags/v0.30.1.tar.gz"
  sha256 "71b889e50a37cff6f3ed31931f1e27da874a98da442eaf052ab2c298eee94db6"
  license "AGPL-3.0-only"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run macos: opt_bin/"libreddit"
  end

  test do
    system "#{bin}/libreddit", "--help"
  end
end
