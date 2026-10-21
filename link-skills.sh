#!/usr/bin/env bash
# Symlink every skills/<name> in this repo into the agent skill folders.
# Usage: ./link-skills.sh [--force] [target_dir ...]
#   default targets: ~/.claude/skills ~/.cursor/skills
#   --force: move an existing, different real folder aside to <name>.bak.<timestamp>
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
force=0
targets=()
for arg in "$@"; do
  if [ "$arg" = "--force" ]; then force=1; else targets+=("$arg"); fi
done
[ ${#targets[@]} -gt 0 ] || targets=("$HOME/.claude/skills" "$HOME/.cursor/skills")

for target in "${targets[@]}"; do
  mkdir -p "$target"
  for src in "$repo"/skills/*/; do
    src="${src%/}"
    name="$(basename "$src")"
    dest="$target/$name"

    if [ -L "$dest" ]; then
      if [ "$(readlink "$dest")" = "$src" ]; then echo "ok      $dest"; continue; fi
      rm "$dest"
    elif [ -e "$dest" ]; then
      if diff -r "$dest" "$src" >/dev/null 2>&1; then
        rm -r "$dest"
      elif [ "$force" -eq 1 ]; then
        bak="$dest.bak.$(date +%Y%m%d%H%M%S)"
        mv "$dest" "$bak"
        echo "backup  $bak"
      else
        echo "SKIPPED $dest (differs from repo; review it or rerun with --force)"
        continue
      fi
    fi
    ln -s "$src" "$dest"
    echo "linked  $dest -> $src"
  done
done
