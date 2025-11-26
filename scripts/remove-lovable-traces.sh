#!/usr/bin/env bash
# remove-lovable-traces.sh
# Usage: ./remove-lovable-traces.sh
# This script replaces occurrences of the string "lovable" (case-insensitive)
# with the string "drizzybear06" in tracked files, creates .bak backups,
# and lists assets and filenames for manual review. It does NOT rewrite git history.

set -euo pipefail

REPL="drizzybear06"

echo "Replacement string: '$REPL'"

# 1) Search for occurrences
if command -v rg >/dev/null 2>&1; then
  echo "Searching with rg..."
  rg --hidden -n --ignore-file .gitignore -S -i "lovable" || true
else
  echo "Searching with git grep..."
  git grep -n --untracked -i "lovable" || true
fi

read -p "Proceed to replace all text occurrences of 'lovable' with '$REPL' in tracked files? (y/N) " yn
if [[ "${yn,,}" != "y" ]]; then
  echo "Aborting replace step."
  exit 0
fi

# 2) Replace in tracked files (preserving backups .bak)
# Use git ls-files to restrict to tracked files (avoid binary files).
git ls-files -z | xargs -0 --no-run-if-empty perl -0777 -pe "s/\\blovable\\b/$REPL/ig" -i.bak

echo "Replacements done. Backup files with .bak created for modified files."

echo "Looking for tracked filenames with 'lovable' in the name..."
mapfile -t items < <(git ls-files -z | xargs -0 -n1 echo | grep -i "lovable" || true)
if [[ ${#items[@]} -eq 0 ]]; then
  echo "No tracked filenames containing 'lovable' found."
else
  echo "Found these files/directories:"
  for f in "${items[@]}"; do
    echo "  $f"
  done
  read -p "Rename these to replace 'lovable' -> '$REPL' using git mv? (y/N) " yn2
  if [[ "${yn2,,}" == "y" ]]; then
    for f in "${items[@]}"; do
      newf="$(echo "$f" | sed -E "s/[Ll]ovable/$REPL/g")"
      mkdir -p "$(dirname "$newf")"
      git mv -f -- "$f" "$newf" || echo "git mv failed for $f -> $newf"
    done
    echo "Renamed tracked files/directories and staged changes."
  else
    echo "Skipping filename renames."
  fi
fi

# 3) List image files that might contain 'lovable' in name or in path (manual cleanup)
echo
echo "Searching images and assets that include 'lovable' in filename..."
git ls-files -z | xargs -0 -n1 echo | grep -Ei "lovable.*\.(png|jpg|jpeg|svg|gif|ico)$" || true

echo

echo "If you see images above you want to remove or replace, delete/replace them and commit."

# 4) Update package.json author/homepage/description if present (best-effort)
if [[ -f package.json ]]; then
  echo
  echo "package.json found. Attempting best-effort update of name/author strings."
  if command -v jq >/dev/null 2>&1; then
    tmp=""
    tmp="$(mktemp)"
    jq --arg r "$REPL" '(.name // .) |= (gsub("lovable"; $r; "i")) |
                       (.author // .) |= (if type=="string" then gsub("lovable"; $r; "i") else . end) |
                       (.homepage // .) |= (if type=="string" then gsub("lovable"; $r; "i") else . end) |
                       (.description // .) |= (if type=="string" then gsub("lovable"; $r; "i") else . end)' package.json > "$tmp" && mv "$tmp" package.json
    echo "package.json updated (jq)."
  else
    echo "jq not installed. Please update package.json manually to remove 'lovable' occurrences."
  fi
fi

echo
echo "Summary:"
echo "- Text occurrences replaced (backups: *.bak). Review changes with git status and git diff."
echo "- Files renamed (if you approved) and staged."
echo "- Images/assets listed for manual review."
echo
echo "Recommended next commands to review and finalize:"
echo "  git add -A"
echo "  git commit -m \"Replace 'lovable' branding with '$REPL'\""
echo "  git push origin HEAD"

echo

echo "Done."