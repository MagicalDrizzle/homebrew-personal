class FfmpegStatic < Formula
  desc "Linux, git master, GPL, static builds of FFmpeg by BtbN"
  homepage "https://github.com/BtbN/FFmpeg-Builds"
  url "https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz"
  version "2026-01-21-12-57"
  sha256 "5d5a7e32385efb4ea5772df2fb0a255805c470fdb5c83f1dfb8abb2f85c4775a"
  license "MIT"

  conflicts_with "ffmpeg", because: "alternate version of ffmpeg"

  def install
    if OS.linux?
      man.install "man"
      prefix.install Dir["*"]
    else
      odie "This package is only available on Linux."
    end
  end

  test do
    # Create a 5 second test MP4
    mp4out = testpath/"video.mp4"
    system bin/"ffmpeg", "-filter_complex", "testsrc=rate=1:duration=5", mp4out
    assert_match(/Duration: 00:00:05\.00,.*Video: h264/m, shell_output("#{bin}/ffprobe -hide_banner #{mp4out} 2>&1"))

    # Re-encode it in HEVC/Matroska
    mkvout = testpath/"video.mkv"
    system bin/"ffmpeg", "-i", mp4out, "-c:v", "hevc", mkvout
    assert_match(/Duration: 00:00:05\.00,.*Video: hevc/m, shell_output("#{bin}/ffprobe -hide_banner #{mkvout} 2>&1"))
  end
end
