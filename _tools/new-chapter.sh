#!/usr/bin/env bash
# usage: _tools/new-chapter.sh "Chapter title" ["summary"]  -> creates the next numbered chapter folder
set -e
cd "$(dirname "$0")/../content"
n=$(printf '%02d' $(( $(ls -d [0-9][0-9]-* | tail -1 | cut -c1-2 | sed 's/^0//') + 1 )))
slug=$(echo "$1" | tr 'A-Z' 'a-z' | tr -cs 'a-z0-9' '-' | sed 's/^-//;s/-$//')
mkdir "$n-$slug"
printf -- '---\ntitle: "%s"\nsummary: "%s"\n---\n' "$1" "${2:-}" > "$n-$slug/_index.md"
echo "created content/$n-$slug"
