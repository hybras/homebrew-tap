class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.09/sshpass-1.09.tar.gz"
  sha256 "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"
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
    system "sshpass"
  end
end
