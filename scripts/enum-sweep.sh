#!/usr/bin/env bash
: "${target:?export target=https://example.com}"
# Light sweep of key paths
for p in / /search?q=test /ping?host=127.0.0.1 /profile ; do
  echo "# GET $p"
  curl -ks "$target$p" | head -n 3
done
