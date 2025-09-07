#!/usr/bin/env bash
: "${target:?export target=https://example.com}"
param="${1:-q}"
while read -r payload; do
  url="$target/search?$param=$payload"
  echo ">>> $url"
  curl -ks "$url" | head -n 2
done
