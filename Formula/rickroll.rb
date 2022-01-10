class Rickroll < Formula
  desc "Rickroll from the terminal"
  homepage "https://github.com/keroserene/rickrollrc"
  license "MIT"
  url "https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh"
  version "0.1.0"

  depends_on "bash"
  depends_on "python@3"

  def install
    bin.install "roll.sh" => "rickroll"
  end

  test do
    system "roll.sh"
  end
end
