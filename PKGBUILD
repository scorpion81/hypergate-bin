
# Maintainer: scorpion81

pkgname=hypergate-bin
pkgver=1.33.0
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

sha512sums=('3812acfc920f4f827a7a60c5b620375de2bcccbfd9e72c239121ca3e8c412da95374fe692292a2494e290ab53355a48206de07db36eb3d8fa57e6a5585b93e2a'
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

    install -dm755 "${pkgdir}/usr/bin"

    ln -s ../lib/hypergate/hypergate \
        "${pkgdir}/usr/bin/hypergate"

    ln -s ../lib/hypergate/hypergated \
        "${pkgdir}/usr/bin/hypergated"
}
