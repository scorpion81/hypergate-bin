
#!/usr/bin/env bash

# Helper script to check for upstream updates,
# refresh PKGBUILD metadata and rebuild the package.

set -Eeuo pipefail

# Must run from the package repository
if [[ ! -f PKGBUILD || ! -f .nvchecker.toml ]]; then
    echo "Error: Run this script from the hypergate-bin directory."
    exit 1
fi

# Avoid overwriting uncommitted changes
if [[ -n "$(git status --porcelain)" ]]; then
    echo "Error: Git working tree is not clean."
    echo "Commit or stash your changes first."
    exit 1
fi

echo "Checking upstream version..."
set +e
pkgctl version check
result=$?
set -e

case "$result" in
    0)
        echo "Hypergate is already up to date."
        exit 0
        ;;
    2)
        echo "New version detected."
        ;;
    *)
        echo "Version check failed (exit code $result)."
        exit "$result"
        ;;
esac

echo
echo "Updating PKGBUILD and checksums..."
pkgctl version upgrade

echo
echo "Verifying updated version against upstream..."
if ! pkgctl version check; then
    echo "Error: PKGBUILD does not match the latest upstream version."
    echo "Keeping existing source files."
    exit 1
fi

echo
echo "Removing cached upstream sources..."
rm -f hypergate-linux-x64.deb hypergate-upstream-LICENSE

echo
echo "Downloading and verifying fresh sources..."
makepkg --verifysource

echo
echo "Regenerating .SRCINFO..."
makepkg --printsrcinfo > .SRCINFO

echo
echo "Building package..."
makepkg -Csf

echo
echo "Checking PKGBUILD..."
namcap PKGBUILD

echo
echo "Changes:"
git diff --check
git diff -- PKGBUILD .SRCINFO

echo
echo "Update completed. Review and commit the changes manually."
