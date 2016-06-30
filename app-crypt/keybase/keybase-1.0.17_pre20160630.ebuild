# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

COMMIT="1828166cd535a446002d678f0057beec0db4b019"

DESCRIPTION="Client for keybase.io"
HOMEPAGE="https://keybase.io/"
SRC_URI="https://github.com/keybase/client/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-lang/go-1.5:0"
RDEPEND="
	app-crypt/gnupg"

S="${WORKDIR}/src/github.com/keybase/client"

src_unpack() {
	unpack "${P}.zip"
	mkdir -p "$(dirname "${S}")" || die
	mv "client-${COMMIT}" "${S}" || die
}

src_compile() {
	GOPATH="${WORKDIR}:${S}/go/vendor" \
	go build -v -x \
	-tags production \
	-o "${T}/keybase" \
	github.com/keybase/client/go/keybase || die
}

src_install() {
	dobin "${T}/keybase"
}
