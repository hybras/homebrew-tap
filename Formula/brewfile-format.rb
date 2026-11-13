class BrewfileFormat < Formula
  desc "Format brew bundle files"
  homepage "https://gitlab.com/hybras/brewfile-format"
  url "https://gitlab.com/hybras/brewfile-format/-/archive/v0.2.0/brewfile-format-v0.2.0.tar.gz"
  sha256 "52b08e5153f9889eb385d177425ac371596a97edf2607cef1206e06d8b5c041c"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://gitlab.com/hybras/brewfile-format.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0d7a288a77a4993bd6b375a562cac8c84ed3f0a51eb97b8b707f1da091646915"
    sha256 cellar: :any,                 x86_64_linux: "edf8b78e37775a556f40701bae2ec599e33ea04fd8c6632861f2105e75c134be"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Create a sample Brewfile
    (testpath/"Brewfile").write <<~EOS
      cask "google-chrome"
      brew "wget"
    EOS

    # Run the formatter and check output
    output = shell_output("#{bin}/brewfile-format #{testpath}/Brewfile")
    expected = <<~EOS
      brew "wget"

      cask "google-chrome"
    EOS
    assert_equal expected, output
  end
end
