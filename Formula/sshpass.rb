class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
  license "GPL-2.0-only"

  # depends_on 'gnu-sed' => :build

  def install
    system "./configure", 
           *std_configure_args, # brew
           "--disable-silent-rules", # brew
           "--disable-debug", 
           "--disable-dependency-tracking",
           # "--prefix=#{prefix}",
           "--mandir=#{man}"
    system "make", "install"
    # man1.install "sshpass.1"
  end

  test do
    system "#{bin}/sshpass"
  end
end
