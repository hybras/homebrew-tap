class DuckdnsTailscale < Formula
  desc "Dynamic dns client that fetches ip from tailscale"
  homepage "https://github.com/hybras/duckdns"
  url "https://github.com/hybras/duckdns/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "9b56cf9c02d3d4735fe8ec443f8d190afbca6d48680da39f6374303430d37f5d"

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
