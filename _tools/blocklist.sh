#!/usr/bin/env bash
# Fails if content/ contains private-looking strings. Add real hostnames to _tools/blocklist.txt (kept out of git).
cd "$(dirname "$0")/.."
bad=0
if grep -rEn '\b(10\.[0-9]+|192\.168|172\.(1[6-9]|2[0-9]|3[01]))\.[0-9]+\.[0-9]+\b|100\.(6[4-9]|[7-9][0-9]|1[01][0-9]|12[0-7])\.[0-9]+\.[0-9]+|\.ts\.net' content --include='*.md' --exclude-dir=_private; then bad=1; fi
if [ -f _tools/blocklist.txt ] && grep -rnFf _tools/blocklist.txt content --include='*.md' --exclude-dir=_private; then bad=1; fi
[ $bad = 0 ] && echo "blocklist ok" || { echo "BLOCKED: private strings found"; exit 1; }
