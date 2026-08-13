#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
core3_dir="${project_root}/Core3"
upstream_url="https://github.com/swgemu/Core3.git"

if [[ -e "${core3_dir}" ]]; then
  echo "Refusing to overwrite existing path: ${core3_dir}" >&2
  exit 1
fi

git clone --branch unstable "${upstream_url}" "${core3_dir}"
git -C "${core3_dir}" remote rename origin upstream

echo
echo "Core3 downloaded to ${core3_dir}"
echo "Upstream remote: $(git -C "${core3_dir}" remote get-url upstream)"
echo "Revision: $(git -C "${core3_dir}" rev-parse HEAD)"
echo "Next: read ${core3_dir}/README.md and ${core3_dir}/linux/README.md"
