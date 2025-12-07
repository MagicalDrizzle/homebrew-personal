#!/usr/bin/env sh

if VERSION=$(brew livecheck --newer-only magicaldrizzle/personal/ffmpeg | grep -Eo "[0-9-]+$"); then
  SHASUM=$(
    curl -sL https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/checksums.sha256 | \
    grep -F ffmpeg-master-latest-linux64-gpl-shared.tar.xz | \
    awk '{ print $1 }'
  )

  sed -ri "s/version \"[0-9-]+\"/version \"$VERSION\"/" "${0%/*}/../../Formula/ffmpeg.rb"
  sed -ri "s/sha256 \"[0-9a-f]+\"/sha256 \"$SHASUM\"/" "${0%/*}/../../Formula/ffmpeg.rb"
else
  exit
fi
