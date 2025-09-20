class RateMirrors < Formula
  desc "Mirror ranking tool for Arch Linux and derivatives"
  homepage "https://github.com/westandskif/rate-mirrors"
  url "https://github.com/westandskif/rate-mirrors/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "a0c5436ad51a5064755bcbf79f153ddcc16713637d2525c2bac8cbdcfc0443c5"
  license "CC-BY-NC-SA-3.0"

  bottle do
    root_url "https://github.com/MagicalDrizzle/homebrew-personal/releases/download/rate-mirrors-0.22.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "843e1a06eb87359976fccdf0b0af01ec49b0ffb48a86fd9bdd246ea20defe19a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "482f6072ae46459b545071435f6a4a34758450c0f9b9f7084dd9468884d6d1d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "90d5fedf187e631f6d8f1360a357f78a5d79da37d691eec996e1b8b447422674"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
    mv("#{bin}/rate_mirrors", bin/"rate-mirrors")
  end

  test do
    assert_match "FINISHED AT:", shell_output("#{bin}/rate-mirrors --max-jumps 1 \
    --top-mirrors-number-to-retest 1 --country-neighbors-per-country 1 arch")
  end
end
