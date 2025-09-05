class BrewfileFormat < Formula
  desc "Format brew bundle files"
  homepage "https://gitlab.com/hybras/brewfile-format"
  url "https://gitlab.com/hybras/brewfile-format/-/archive/v0.2.0/brewfile-format-v0.2.0.tar.gz"
  sha256 "52b08e5153f9889eb385d177425ac371596a97edf2607cef1206e06d8b5c041c"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://gitlab.com/hybras/brewfile-format.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "45081e1a54ee8537dd4334d7ea0cf1911ed155b05774f9c7836865e235bb6759"
    sha256 cellar: :any_skip_relocation, ventura:       "218d40875bd933ee1f0a4108870a66b8aba422af9c27e90c8aefd48a4b2e7467"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "90fcc0db56fb9ac1a9c92a93a14b2e3d8b969360aea52fea5035bd9ee9450ffd"
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
