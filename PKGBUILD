# Maintainer: scorpion81

pkgname=hypergate-bin
pkgver=1.27.0
pkgrel=1
pkgdesc="Local-first runtime and gateway for MCP servers."
arch=('x86_64')
url="https://hypergate.app"
license=('MIT')

depends=(
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'libsoup3'
    'webkit2gtk-4.1'
    'libxdo3'
)

makedepends=('libarchive')

options=('!strip' '!emptydirs')

source=(
    "hypergate-linux-x64.deb::https://github.com/nekko-labs/hypergate/releases/download/v${pkgver}/hypergate-linux-x64.deb"
    "hypergate-upstream-LICENSE::https://raw.githubusercontent.com/nekko-labs/hypergate/v${pkgver}/LICENSE"
)

sha512sums=('e3a0ed80909c5d1d7be883aa70abfb770c1e6c8ec07eb0434c36911e3a996c08f3a1398bd4dccea68c88a8b9ea6e4949391d0cd08064e6f0c08dee300ff2d7f5'
            '1ac3ac00b68bd0e97f9a12cea04c9aed45ed2bf0da24effccbfcf4ce93ce53e29167245cacbeb8566f9aa6789dda8463bb95f45158561f063f74c8727f736ee6')

prepare() {
    bsdtar -xf "${srcdir}/hypergate-linux-x64.deb" -C "${srcdir}"
}

package() {
    tar -xJf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    rm -f "${pkgdir}/usr/share/doc/hypergate/LICENSE"

    install -Dm644 "${srcdir}/hypergate-upstream-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
