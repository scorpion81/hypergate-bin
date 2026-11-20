
# Maintainer: scorpion81

pkgname=hypergate-bin
pkgver=1.30.0
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

options=('!strip' '!emptydirs')

source=(
    "https://github.com/nekko-labs/hypergate/releases/download/v${pkgver}/hypergate-${pkgver}-linux-amd64.tar.gz"
    "hypergate.desktop"
    "hypergate.svg"
)

sha512sums=('c1644a4b35c095b6d9d133be4397492fc1509326a61d1bdd903e24bb02b00b825d8435896ccfe2bf3bedf7cd5c71941e258723327056b87af6ee7f03136f2b8e'
            'd8f504108098f6f966920508428689da2269d4851998c27bfc3751374ea77273fb4446647361e8b630c2a580cd47a8399469414221e36ba71e18149ae3d10b62'
            '687397a55de54566f75e37d21ecedb893087bdb080052a4ce0b1b3c9abe7142d133c716cb0b7fa24529854e8988b5e3aad59bf3d9fd5eb892c019b861e64f645')

package() {
    install -dm755 "${pkgdir}/usr/lib/hypergate"

    install -Dm755 "${srcdir}/hypergate" \
        "${pkgdir}/usr/lib/hypergate/hypergate"

    install -Dm755 "${srcdir}/hypergated" \
        "${pkgdir}/usr/lib/hypergate/hypergated"

    cp -a "${srcdir}/web" "${pkgdir}/usr/lib/hypergate/"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/hypergate.desktop" \
        "${pkgdir}/usr/share/applications/hypergate.desktop"

    install -Dm644 "${srcdir}/hypergate.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hypergate.svg"
}
