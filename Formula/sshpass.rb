class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
  license "GPL-2.0-only"

  bottle do
    root_url "https://ghcr.io/v2/hybras/tap"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2bde9a23ff2d0af022d588e19208883a5f318eb73c6e5b473cc0de83c9463db2"
    sha256 cellar: :any,                 x86_64_linux: "b40add6496265036cdd41d6cc581999fb2a7e542ab0019ed551eae4cb1afecbc"
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
    system bin/"sshpass", "-h"
  end
end
