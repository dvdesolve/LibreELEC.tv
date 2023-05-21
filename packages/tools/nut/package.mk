# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nut"
PKG_VERSION="2.8.0"
PKG_SHA256="c3e5a708da797b7c70b653d37b1206a000fcb503b85519fe4cdf6353f792bfe5"
PKG_ARCH="any"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/networkupstools/nut"
PKG_URL="https://github.com/networkupstools/${PKG_NAME}/releases/download/v${PKG_VERSION}/nut-${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="Viktor Drobot <linux776@gmail.com> (dvdesolve)"
PKG_DEPENDS_TARGET="toolchain glibc libtool libusb-compat systemd"
PKG_LONGDESC="A collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware"

PKG_TOOLCHAIN="configure"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                          --datadir=/usr/share/nut \
                          --libexecdir=/usr/lib/nut \
                          --sbindir=/usr/bin \
                          --sysconfdir=/etc/nut \
                          --disable-static \
                          --with-user=nut \
                          --with-group=nut \
                          --with-altpidpath=/run/nut \
                          --with-drvpath=/usr/lib/nut \
                          --with-pidpath=/run/nut \
                          --with-statepath=/var/lib/nut \
                          --with-systemdsystemunitdir=/usr/lib/systemd/system \
                          --with-udev-dir=/usr/lib/udev \
                          --without-cgi \
                          --without-dev \
                          --without-doc \
                          --with-libltdl \
                          --without-neon \
                          --without-openssl \
                          --with-serial \
                          --without-snmp \
                          --with-usb \
                          --without-avahi \
                          --without-ipmi \
                          --without-freeipmi \
                          --without-powerman \
                          --without-wrap"

post_makeinstall_target() {
  find ${INSTALL}/storage/nut/etc/nut -name *.sample -exec rename '.sample' '' {} \;

  install -Dm 644 ${PKG_DIR}/nut.sysusers ${INSTALL}/storage/nut/usr/lib/sysusers.d/nut.conf
  install -Dm 644 ${PKG_DIR}/nut.tmpfiles ${INSTALL}/storage/nut/usr/lib/tmpfiles.d/nut.conf
}
