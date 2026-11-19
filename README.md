# hypergate-bin

Arch Linux packaging for [Hypergate](https://github.com/nekko-labs/hypergate), a local-first runtime and gateway for MCP servers.

This repository contains the PKGBUILD and related packaging files required to build and install Hypergate on Arch Linux and Arch-based distributions.

## About Hypergate

Hypergate is a local-first runtime and gateway for Model Context Protocol (MCP) servers, providing a centralized way to manage and connect AI agents with external tools and services.

For more information, visit the [official Hypergate repository](https://github.com/nekko-labs/hypergate).

## Package Information

| Property | Value |
|---|---|
| Package name | `hypergate-bin` |
| Current version | `1.26.0` |
| Architecture | `x86_64` |
| Package type | Prebuilt binary |
| Upstream source | Official GitHub releases |
| License | MIT |

The package uses the official upstream Debian release and repackages its contents for Arch Linux. No application binaries are modified or rebuilt.

## Dependencies

Runtime dependencies:

- `cairo`
- `gdk-pixbuf2`
- `glib2`
- `gtk3`
- `libsoup3`
- `webkit2gtk-4.1`
- `libxdo3`

Build dependency:

- `libarchive`

## Building

Clone this repository and build the package using `makepkg`:

```bash
git clone https://github.com/scorpion81/hypergate-bin.git
cd hypergate-bin
makepkg -si
```

`makepkg` downloads the official upstream Debian package and license file, verifies their SHA512 checksums, extracts the application and creates an Arch Linux package.

## Installed Files

The package installs:

- Hypergate application: `/usr/lib/hypergate/hypergate`
- Hypergate daemon: `/usr/lib/hypergate/hypergated`
- Command-line launchers: `/usr/bin/hypergate` and `/usr/bin/hypergated`
- Web interface assets: `/usr/lib/hypergate/web/`
- Desktop entry: `/usr/share/applications/hypergate.desktop`
- Application icon: `/usr/share/icons/hicolor/scalable/apps/hypergate.svg`

## Version Updates

Upstream releases are tracked using [nvchecker](https://github.com/lilydjwg/nvchecker).

The `.nvchecker.toml` configuration tracks Git tags in the official Hypergate repository and uses the `v` prefix to detect new releases.

After an upstream release, update `pkgver`, refresh the source checksums, regenerate `.SRCINFO`, and test the package build.

## Status

The PKGBUILD has been successfully built and tested on CachyOS (Arch Linux-based).

Both the Hypergate graphical application and gateway daemon have been launched and verified locally.

## Updating the package

Run the included update script:

    ./update.sh

The script checks for new upstream releases, updates the PKGBUILD
and checksums, regenerates .SRCINFO and builds the package.

Changes are never committed or pushed automatically. Review the
result and commit manually when everything looks good.

## Contributing

Contributions, testing and maintenance assistance are welcome.

This packaging project is intended to make the official Hypergate Linux release conveniently available to Arch Linux users.

If you are interested in maintaining this package in the AUR, feel free to open an issue or submit a pull request.

## Disclaimer

This is an unofficial community packaging project and is not affiliated with or endorsed by Nekko Labs.

Hypergate itself is developed and maintained by [Nekko Labs](https://github.com/nekko-labs/hypergate).

## License

The packaging files in this repository are licensed under the
BSD Zero Clause License (0BSD).

Hypergate itself is distributed under its own upstream license.
See the [official Hypergate repository](https://github.com/nekko-labs/hypergate).
