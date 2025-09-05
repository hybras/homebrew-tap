class BrewfileFormat < Formula
  desc "Format brew bundle files"
  homepage "https://gitlab.com/hybras/brewfile-format"
  url "https://gitlab.com/hybras/brewfile-format/-/archive/v0.2.0/brewfile-format-v0.2.0.tar.gz"
  sha256 "52b08e5153f9889eb385d177425ac371596a97edf2607cef1206e06d8b5c041c"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://gitlab.com/hybras/brewfile-format.git", branch: "main"

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
