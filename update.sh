
#!/usr/bin/env bash

# Check for upstream updates, refresh PKGBUILD metadata
# and build the package.

set -Eeuo pipefail

if [[ ! -f PKGBUILD || ! -f .nvchecker.toml ]]; then
    echo "Error: Run this script from the hypergate-bin directory."
    exit 1
fi

if [[ "${GITHUB_ACTIONS:-}" == "true" &&
      "${ACT:-}" != "true" ]] &&
   [[ -n "$(git status --porcelain)" ]]; then
    echo "Error: Git working tree is not clean."
    echo "Commit or stash your changes first."
    exit 1
fi

check_upstream() {
    local report rc

    report=$(mktemp)

    echo "Checking upstream version..." >&2

    if pkgctl version check --json > "$report"; then
        rc=0
    else
        rc=$?
    fi

    if ! jq -e '
        type == "array" and
        length == 1 and
        .[0].status == "success" and
        (.[0].out_of_date | type == "boolean")
    ' "$report" >/dev/null; then
        cat "$report"
        echo "Error: Version check failed (exit code $rc)."
        rm -f "$report"
        return 1
    fi

    cat "$report" >&2
    jq -r '.[0].out_of_date' "$report"

    rm -f "$report"
}

out_of_date=$(check_upstream)

if [[ "$out_of_date" == "true" ]]; then
    echo
    echo "New version detected. Updating PKGBUILD..."

    pkgctl version upgrade --verbose || true

    echo "Updated package version:"
    grep -E '^(pkgver|pkgrel)=' PKGBUILD

    echo
    echo "Verifying updated version..."

    out_of_date=$(check_upstream)

    if [[ "$out_of_date" != "false" ]]; then
        echo "Error: PKGBUILD does not match upstream version."
        exit 1
    fi
else
    echo
    echo "Hypergate is already up to date."
fi

echo
echo "Downloading and verifying sources..."
makepkg --verifysource

echo
echo "Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo
echo "Building package..."
makepkg -Csf --noconfirm

echo
echo "Checking PKGBUILD..."
namcap PKGBUILD

echo
echo "Checking package..."
namcap ./*.pkg.tar.zst

echo
echo "Changes:"
git diff --check
git diff -- PKGBUILD .SRCINFO

echo
echo "Update completed. Review and commit the changes manually."
