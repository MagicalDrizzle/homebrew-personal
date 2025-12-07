class SharedextentsCpp < Formula
  desc "Tool to show what files share extents in a btrfs filesystem"
  homepage "https://github.com/markopetrovi/sharedextents"
  url "https://github.com/markopetrovi/sharedextents/raw/3b96760b1fce4b8ecb8a2eae26295d4dbe03206a/src/sharedextents.cpp"
  version "1.0-3b96760"
  sha256 "efcbb4d8e0fe4cb6fb2242a4b81be94655c85c39362416c4980dbe1a4d2e83a9"
  license "GPL-2.0-only"

  def install
    system ENV.cxx, "-O2", "-s", "-flto", "-std=c++11", "sharedextents.cpp", "-o", "sharedextents-cpp"
    bin.install "sharedextents-cpp"
  end

  test do
    assert_match "open: No such file or directory", shell_output("#{bin}/sharedextents-cpp a 2>&1", 1)
  end
end
