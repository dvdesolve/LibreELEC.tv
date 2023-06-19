# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="nut"
PKG_VERSION="2.8.0"
PKG_REV="100"
PKG_SHA256="c3e5a708da797b7c70b653d37b1206a000fcb503b85519fe4cdf6353f792bfe5"
PKG_ARCH="any"
PKG_LICENSE="GPLv2+"
PKG_SITE="https://github.com/networkupstools/nut"
PKG_URL="https://github.com/networkupstools/nut/releases/download/v${PKG_VERSION}/nut-${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="Viktor Drobot <linux776 [at] gmail.com> (dvdesolve)"
PKG_DEPENDS_TARGET="toolchain glibc libtool libusb-compat systemd"
PKG_LONGDESC="A collection of programs which provide a common interface for monitoring and administering UPS, PDU and SCD hardware"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Network UPS Tools (NUT)"
PKG_ADDON_TYPE="xbmc.service"

PKG_TOOLCHAIN="configure"
PKG_CONFIGURE_OPTS_TARGET="--prefix=/storage/.kodi/addons/${PKG_ADDON_ID} \
                          --datadir=/storage/.kodi/addons/${PKG_ADDON_ID}/share \
                          --libexecdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
                          --sbindir=/storage/.kodi/addons/${PKG_ADDON_ID}/bin \
                          --sysconfdir=/storage/.kodi/addons/${PKG_ADDON_ID}/config \
                          --disable-static \
                          --with-user=nut \
                          --with-group=nut \
                          --with-altpidpath=/run/nut \
                          --with-drvpath=/storage/.kodi/addons/${PKG_ADDON_ID}/lib \
                          --with-pidpath=/run/nut \
                          --with-statepath=/var/lib/nut \
                          --with-systemdsystemunitdir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib/systemd/system \
                          --with-udev-dir=/storage/.kodi/addons/${PKG_ADDON_ID}/lib/udev \
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

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}
  cp -r ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/bin ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/lib ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/share ${ADDON_BUILD}/${PKG_ADDON_ID}/
  cp -r ${PKG_INSTALL}/storage/.kodi/addons/${PKG_ADDON_ID}/config ${ADDON_BUILD}/${PKG_ADDON_ID}/

  install -Dm 644 ${PKG_DIR}/nut.sysusers ${PKG_INSTALL}/storage/.config/sysusers.d/nut.conf
  install -Dm 644 ${PKG_DIR}/nut.tmpfiles ${PKG_INSTALL}/storage/.config/tmpfiles.d/nut.conf
}
