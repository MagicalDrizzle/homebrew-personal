#!/usr/bin/env sh
set -eux

if VERSION=$(brew livecheck --newer-only magicaldrizzle/personal/ffmpeg | grep -Eo "[0-9-]+$"); then
  SHASUM=$(
    curl -sL https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/checksums.sha256 | \
    grep -F ffmpeg-master-latest-linux64-gpl-shared.tar.xz | \
    awk '{ print $1 }'
  )
  sed -Ei "s/version \"[0-9-]+\"/version \"$VERSION\"/" "$(dirname "$0")/../../Formula/ffmpeg.rb"
  sed -Ei "s/sha256 \"[0-9a-f]+\"/sha256 \"$SHASUM\"/" "$(dirname "$0")/../../Formula/ffmpeg.rb"
fi
