class Fienode < Formula
  desc "Discover identical CoW copies, analogous to an inode"
  homepage "https://github.com/pwaller/fienode"
  url "https://github.com/pwaller/fienode/releases/download/v1.0/fienode-linux-amd64"
  version "1.0"
  sha256 "a9708c0c9acfb011f182f3327fdcd4e07a49b3d12eab64cb0937333359a7c1c8"
  license "MIT"

  def install
    bin.install "fienode-linux-amd64"
    mv(bin/"fienode-linux-amd64", bin/"fienode")
  end

  test do
    assert_match "no such file or directory", shell_output("#{bin}/fienode a 2>&1", 1)
  end
end
