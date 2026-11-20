# hypergate-bin

Unofficial Arch Linux packaging for [Hypergate](https://github.com/nekko-labs/hypergate), a local-first runtime and gateway for Model Context Protocol (MCP) servers.

This repository provides Arch Linux packages built from official upstream sources, together with automated version checking and package builds.

## Packages

| Package | Description |
|---|---|
| `hypergate-bin` | Hypergate application, gateway daemon and web interface |
| `libxdo3` | Legacy `libxdo.so.3` compatibility library required by Hypergate |

`hypergate-bin` repackages the official prebuilt Linux release. The upstream application binaries are not modified or rebuilt.

`libxdo3` is built separately from the original xdotool source to provide the legacy shared library required by Hypergate.

## Installation

Download both packages from the latest [GitHub Release](https://github.com/scorpion81/hypergate-bin/releases).

From the directory containing the downloaded packages, install them with:

```bash
sudo pacman -U ./libxdo3-*.pkg.tar.zst ./hypergate-bin-*.pkg.tar.zst
```

Both packages must be installed because `hypergate-bin` depends on `libxdo3`.

## Building from source

Requirements:

- Arch Linux or an Arch-based distribution
- `base-devel`
- Git

Clone the repository:

```bash
git clone https://github.com/scorpion81/hypergate-bin.git
cd hypergate-bin
```

Build and install the compatibility library first:

```bash
cd libxdo3
makepkg -si
cd ..
```

Then build and install Hypergate:

```bash
makepkg -si
```

`makepkg` downloads the official upstream sources, verifies their checksums and creates the corresponding Arch Linux package.

## Installed files

The `hypergate-bin` package installs:

- Hypergate application: `/usr/lib/hypergate/hypergate`
- Gateway daemon: `/usr/lib/hypergate/hypergated`
- Command-line launchers: `/usr/bin/hypergate` and `/usr/bin/hypergated`
- Web interface assets: `/usr/lib/hypergate/web/`
- Desktop entry: `/usr/share/applications/hypergate.desktop`
- Application icon: `/usr/share/icons/hicolor/scalable/apps/hypergate.svg`

## Automated updates

Upstream versions are tracked using [nvchecker](https://github.com/lilydjwg/nvchecker).

The repository includes an update script:

```bash
./update.sh
```

It:

1. Checks the latest upstream release.
2. Updates the package version and source checksums when necessary.
3. Verifies the downloaded sources.
4. Regenerates `.SRCINFO`.
5. Builds the package.
6. Runs `namcap` checks on the PKGBUILD and generated package.

Changes are not committed or pushed automatically by this script. They can be reviewed and committed manually.

## GitHub Actions

The repository also provides a manually triggered GitHub Actions workflow.

It builds the packages inside an Arch Linux container and uploads the resulting packages as workflow artifacts.

Two optional workflow inputs are available:

- `create_pr`: Create a pull request containing the upstream version update.
- `create_release`: Create a draft GitHub Release containing both packages.

Both options are disabled by default.

When requested, the workflow creates an update branch based on `master`. Draft releases are created only when both packages are available. Existing version tags are never overwritten.

Releases remain drafts until manually reviewed and published.

## Status

The packages have been successfully built, installed and tested on CachyOS (Arch Linux-based).

Both the Hypergate graphical application and gateway daemon have been launched and verified locally.

The repository's automated build workflow has also been tested successfully using GitHub Actions.

## Contributing

Contributions, testing and maintenance assistance are welcome.

If you encounter packaging issues or have suggestions, please open an issue or submit a pull request.

## Disclaimer

This is an unofficial community packaging project. It is not affiliated with or endorsed by Nekko Labs.

Hypergate is developed and maintained by [Nekko Labs](https://github.com/nekko-labs/hypergate).

## Licenses

- Packaging files: [BSD Zero Clause License (0BSD)](https://opensource.org/license/0bsd)
- Hypergate: MIT License (upstream)
- `libxdo3`: BSD-3-Clause License (upstream xdotool)

Please refer to the respective upstream projects for their license terms.
