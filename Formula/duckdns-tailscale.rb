class DuckdnsTailscale < Formula
  desc "Dynamic dns client that fetches ip from tailscale"
  homepage "https://github.com/hybras/duckdns"
  url "https://github.com/hybras/duckdns/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "79ed573a8168fd0035c38f51a7bd426c61394af715fa5b052f40e9fbb028c99d"

  depends_on "tailscale"

  def install
    bin.install "duckdns"
  end

  test do
    system bin/"duckdns"
  end

  service do
    run bin/"duckdns"
    run_type :interval
    interval 300
    log_path var / "log" / "duckdns.log"
    error_log_path var / "log" / "duckdns.log"
  end
end
