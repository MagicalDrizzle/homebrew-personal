class Shitpic < Formula
  desc "Recompresses JPEGs to make shitpics"
  homepage "https://github.com/earthboundkid/shitpic"
  url "https://github.com/earthboundkid/shitpic/archive/7f384b26950378e5e2afb21671b06b916c058b23.tar.gz"
  version "1.0-7f384b2"
  sha256 "57761123732909bf0149f0a4cd843f05039d1279669318b254141823bb283c94"
  license "MIT"

  bottle do
    root_url "https://github.com/MagicalDrizzle/homebrew-personal/releases/download/shitpic-1.0-7f384b2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "c296c04daa3e18c2114ea22097ca78571577b9f779c56f7c7d7e2549f1f86670"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "333d1778198178c2b772c86292f8a5631a808ecd35c15e093574f02d5be577fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "873e14937198d0984dbd5bb3301e6b221e5f057f28c95a6f946bf5902713084e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "cmd/shitpic/shitpic.go"
  end

  test do
    cp test_fixtures("test.jpg"), testpath
    assert_match ".....", shell_output("#{bin}/shitpic -cycles 5 #{testpath}/test.jpg #{testpath}/output.jpg 2>&1")
    assert_path_exists testpath/"output.jpg"
  end
end
