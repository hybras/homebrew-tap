class DuckdnsTailscale < Formula
  desc "Dynamic dns client that fetches ip from tailscale"
  homepage "https://github.com/hybras/duckdns"
  url "https://github.com/hybras/duckdns/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d5536bb82e65eaa4c19ca8e62c73ff5313a3a8d4ad6e29b9d61f2407bea567b1"
  license "BSD-2-Clause"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "4bda47ef6368d21905b5ce10e326e6904f5d646395aebd9392c5fd4a124622d6"
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
