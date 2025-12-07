class Sharedextents < Formula
  desc "Show proportion of physical extents shared between two files"
  homepage "https://github.com/pwaller/sharedextents"
  url "https://github.com/pwaller/sharedextents/releases/download/v1.0/sharedextents"
  sha256 "bade0e85837b0420dcf37243689283bb30c6171c7eb21d121c48f75baa8308ed"
  license "MIT"

  def install
    bin.install "sharedextents"
  end

  test do
    assert_match "no such file or directory", shell_output("#{bin}/sharedextents a b 2>&1", 1)
  end
end
