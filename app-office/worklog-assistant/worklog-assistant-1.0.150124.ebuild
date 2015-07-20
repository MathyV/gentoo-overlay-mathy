# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils

DESCRIPTION="Hassle-free time tracking for JIRA self-hosted and OnDemand"
HOMEPAGE="https://worklogassistant.com"

SUFFIX="rdae0"

SRC_URI="
	amd64? ( https://storage.googleapis.com/worklog-assistant-downloads/WorklogAssistant-${PV}-${SUFFIX}_x86_64.tgz )
	x86?   ( https://storage.googleapis.com/worklog-assistant-downloads/WorklogAssistant-${PV}-${SUFFIX}_i686.tgz )
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	net-nds/openldap
	dev-libs/cyrus-sasl
	gnome-base/libgnome-keyring
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/WorklogAssistant"

src_install() {
	insinto /opt/WorklogAssistant

	doins -r *
	fperms -R 0755 /opt/WorklogAssistant/bin/WorklogAssistant

	dosym /opt/WorklogAssistant/bin/WorklogAssistant /usr/bin/WorklogAssistant
}
