#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/lvsovoy/russian-phonetic-les.git"
TARGET_DIR="${HOME}/.local/src/russian-phonetic-les"
BRANCH="master"

log() {
  echo "[russian-phonetic-les] $*"
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

require_cmd git
require_cmd setxkbmap
require_cmd sudo

if [ -d "${TARGET_DIR}/.git" ]; then
  log "Repository exists at ${TARGET_DIR}; pulling latest changes"
  git -C "${TARGET_DIR}" fetch --all --tags --prune
  git -C "${TARGET_DIR}" checkout "${BRANCH}"
  git -C "${TARGET_DIR}" pull --ff-only
else
  log "Cloning repository into ${TARGET_DIR}"
  mkdir -p "$(dirname "${TARGET_DIR}")"
  git clone --depth 1 --branch "${BRANCH}" "${REPO_URL}" "${TARGET_DIR}"
fi

LINUX_DIR="${TARGET_DIR}/release/1.2/linux"
SYMBOLS_FILE="${LINUX_DIR}/ru_les"
XCOMPOSE_SNIPPET="${LINUX_DIR}/russian-phonetic-les.XCompose"

if [ ! -f "${SYMBOLS_FILE}" ] || [ ! -f "${XCOMPOSE_SNIPPET}" ]; then
  echo "Linux layout files were not found in ${LINUX_DIR}" >&2
  exit 1
fi

log "Installing keyboard symbols to /usr/share/X11/xkb/symbols/ru_les"
sudo cp "${SYMBOLS_FILE}" /usr/share/X11/xkb/symbols/ru_les

XCOMPOSE_FILE="${HOME}/.XCompose"
MARKER_START="# >>> russian-phonetic-les start >>>"
MARKER_END="# <<< russian-phonetic-les end <<<"

if [ -f "${XCOMPOSE_FILE}" ] && grep -q "${MARKER_START}" "${XCOMPOSE_FILE}"; then
  log "Existing russian-phonetic-les section found in ${XCOMPOSE_FILE}; replacing"
  tmp_file="$(mktemp)"
  awk -v start="${MARKER_START}" -v end="${MARKER_END}" '
    $0 == start { skip=1; next }
    $0 == end { skip=0; next }
    !skip { print }
  ' "${XCOMPOSE_FILE}" > "${tmp_file}"
  mv "${tmp_file}" "${XCOMPOSE_FILE}"
fi

log "Appending compose rules to ${XCOMPOSE_FILE}"
{
  echo "${MARKER_START}"
  cat "${XCOMPOSE_SNIPPET}"
  echo "${MARKER_END}"
} >> "${XCOMPOSE_FILE}"

log "Activating layout for current X session"
setxkbmap ru_les

log "Done. Layout installed and activated."
log "If your desktop environment overrides keyboard settings, re-select layout name: ru_les."
