class DuckdnsTailscale < Formula
  desc "Dynamic dns client that fetches ip from tailscale"
  homepage "https://github.com/hybras/duckdns"
  url "https://github.com/hybras/duckdns/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d5536bb82e65eaa4c19ca8e62c73ff5313a3a8d4ad6e29b9d61f2407bea567b1"
  license "BSD-2-Clause"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "e0504faa0b039cb44b0bcd8f78c2db467630120ea9f0af0faecaab009645738a"
  end

  depends_on "tailscale"

  def install
    bin.install "duckdns-ts"
  end

  test do
    system bin/"duckdns-ts"
  end

  service do
    run opt_bin/"duckdns-ts"
    run_type :interval
    interval 300
    log_path var / "log" / "duckdns.log"
    error_log_path var / "log" / "duckdns.log"
  end
end
