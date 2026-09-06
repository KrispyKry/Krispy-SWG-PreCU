#!/usr/bin/env bash
set -euo pipefail

project_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${project_root}"

failures=0
check() {
  local label="$1"
  local pattern="$2"
  local matches
  matches="$(git ls-files --cached --others --exclude-standard | rg -i --glob '!scripts/audit-public-tree.sh' --glob '!AGPL-COMPLIANCE.md' --glob '!PUBLIC-SOURCE-BOUNDARY.md' --glob '!README.md' --glob '!LICENSE-NOTICE.md' --glob '!docs/SOURCE-PROVENANCE.md' "${pattern}" || true)"
  if [[ -n "${matches}" ]]; then
    echo "FAIL: ${label}"
    echo "${matches}"
    failures=$((failures + 1))
  fi
}

echo "Auditing public tree: ${project_root}"
check "retail/client archive or executable detected" '(^|/)(client|game-data|.*\.(tre|toc|exe|dll|msi|pak|wad|iso))$'
check "secret-bearing file detected" '(^|/)(secrets?|private|ops-private|qa-private|release-private|.*\.(pem|key|p12|pfx|crt|env|sql|sql\.gz))$'
check "backup/log/private-state file detected" '(^|/)(backups?|logs?|dumps?|.*\.(bak|dump|sqlite|db))($|/)'
check "credential-like filename detected" '(password|passwd|credential|token|secret|apikey|api-key|auth)' 

if git ls-files --cached --others --exclude-standard | rg -i '(^|/)(config-local\.lua|.*\.env.*)$' >/dev/null; then
  echo "FAIL: local configuration or environment file detected"
  git ls-files --cached --others --exclude-standard | rg -i '(^|/)(config-local\.lua|.*\.env.*)$'
  failures=$((failures + 1))
fi

if [[ -d Core3 ]]; then
  [[ -f Core3/COPYING ]] || { echo "FAIL: Core3/COPYING is missing from the published source tree"; failures=$((failures + 1)); }
  [[ -d Core3/MMOCoreORB ]] || { echo "FAIL: Core3/MMOCoreORB is missing from the published source tree"; failures=$((failures + 1)); }
else
  echo "NOTICE: Core3 source is not present; this is still a bootstrap-only repository."
fi

if [[ ${failures} -ne 0 ]]; then
  echo "Public-tree audit failed with ${failures} issue(s). Do not publish or submit this tree."
  exit 1
fi

echo "Public-tree audit passed. This checks repository hygiene only; it does not determine AGPL compliance by itself."
