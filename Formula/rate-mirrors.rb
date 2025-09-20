class RateMirrors < Formula
  desc "Mirror ranking tool for Arch Linux and derivatives"
  homepage "https://github.com/westandskif/rate-mirrors"
  url "https://github.com/westandskif/rate-mirrors/archive/refs/tags/v0.22.0.tar.gz"
  sha256 "a0c5436ad51a5064755bcbf79f153ddcc16713637d2525c2bac8cbdcfc0443c5"
  license "CC-BY-NC-SA-3.0"

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
