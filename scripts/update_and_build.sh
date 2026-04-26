#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

VENV_PY="$ROOT_DIR/robotics_course_venv/bin/python"
VENV_PIP="$ROOT_DIR/robotics_course_venv/bin/pip"
MKDOCS="$ROOT_DIR/robotics_course_venv/bin/mkdocs"

INDEX_URL="${PIP_INDEX_URL:-https://pypi.tuna.tsinghua.edu.cn/simple}"
TRUSTED_HOST="${PIP_TRUSTED_HOST:-pypi.tuna.tsinghua.edu.cn}"

UPSTREAM_REMOTE="${UPSTREAM_REMOTE:-origin}"
UPSTREAM_BRANCH="${UPSTREAM_BRANCH:-master}"
UPSTREAM_REF="$UPSTREAM_REMOTE/$UPSTREAM_BRANCH"

DEPLOY_DIR="${DEPLOY_DIR:-$ROOT_DIR/site}"

LOCK_PATH="$ROOT_DIR/.update_build.lock"
exec 9>"$LOCK_PATH"
flock -n 9 || exit 0

timestamp() { date -Is; }

if [[ ! -x "$MKDOCS" ]]; then
  echo "$(timestamp) error: mkdocs not found in venv: $MKDOCS"
  exit 1
fi

if [[ -n "$(git status --porcelain=v1)" ]]; then
  echo "$(timestamp) error: working tree is not clean"
  exit 1
fi

echo "$(timestamp) update: fetching $UPSTREAM_REF"
git fetch --prune "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH"

LOCAL_REV="$(git rev-parse HEAD)"
REMOTE_REV="$(git rev-parse "$UPSTREAM_REF")"

if [[ "$LOCAL_REV" == "$REMOTE_REV" ]]; then
  echo "$(timestamp) update: no changes"
  exit 0
fi

echo "$(timestamp) update: pulling $UPSTREAM_REF"
git pull --ff-only "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH"
NEW_REV="$(git rev-parse HEAD)"

if git diff --name-only "$LOCAL_REV" "$NEW_REV" | grep -qx 'requirements.txt'; then
  echo "$(timestamp) update: requirements changed, syncing venv"
  "$VENV_PIP" install -i "$INDEX_URL" --trusted-host "$TRUSTED_HOST" -r "$ROOT_DIR/requirements.txt"
fi

TMP_OUT="$ROOT_DIR/.site_build_tmp"
rm -rf "$TMP_OUT"

echo "$(timestamp) build: mkdocs -> $TMP_OUT"
"$MKDOCS" build -d "$TMP_OUT"

mkdir -p "$DEPLOY_DIR"
rsync -a --delete "$TMP_OUT"/ "$DEPLOY_DIR"/
rm -rf "$TMP_OUT"

echo "$(timestamp) build: done ($NEW_REV)"
