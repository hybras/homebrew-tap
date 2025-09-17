class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
  license "GPL-2.0-only"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "84ba8dc042ab4161ab7270f1227402635ae3438a25aeb6fcf9505e4251bf254c"
    sha256 cellar: :any_skip_relocation, ventura:       "d8910d3b8d47c192efdb060e0bbecd647372dedfc770304e2fcf6693ea510b07"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "889ca896637a79fe06f21fb84a71e1072c1177c7ce0315c20c476d88cdea0ce2"
  end

  def install
    system "./configure",
           *std_configure_args,
           "--disable-silent-rules",
           "--disable-debug",
           "--disable-dependency-tracking",
           "--mandir=#{man}"
    system "make", "install"
  end

  test do
    system "#{bin}/sshpass", "-h"
  end
end
