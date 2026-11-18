# Maintainer: scorpion81

pkgname=hypergate-bin
pkgver=1.26.0
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

sha512sums=(
    'e541f9a7d5bd83d779f77405da21981c4118392be294314cc1f8fa53fd1fd0c3bd521369a3ab0d0239ab128a7032432867c5a037f3569d57fa32b5b0ac87e4a1'
    '1ac3ac00b68bd0e97f9a12cea04c9aed45ed2bf0da24effccbfcf4ce93ce53e29167245cacbeb8566f9aa6789dda8463bb95f45158561f063f74c8727f736ee6'
)

prepare() {
    bsdtar -xf "${srcdir}/hypergate-linux-x64.deb" -C "${srcdir}"
}

package() {
    tar -xJf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    rm -f "${pkgdir}/usr/share/doc/hypergate/LICENSE"

    install -Dm644 "${srcdir}/hypergate-upstream-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
