#!/usr/bin/env bash
# usage: _tools/new-chapter.sh "Chapter title" ["summary"]  -> next numbered chapter file (a draft)
set -e
cd "$(dirname "$0")/../content/chapters"
last=$(ls [0-9][0-9]-*.md 2>/dev/null | tail -1 | cut -c1-2 | sed 's/^0//')
n=$(printf '%02d' $(( ${last:--1} + 1 )))
slug=$(echo "$1" | tr 'A-Z' 'a-z' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')
printf -- '---\ntitle: "%s"\nslug: %s\ndate: %s\nsummary: "%s"\ndraft: true\n---\n' "$1" "$slug" "$(date +%F)" "${2:-}" > "$n-$slug.md"
echo "created content/chapters/$n-$slug.md"
