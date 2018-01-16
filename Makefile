#
# Copyright (c) 2018 Andrii Korzh (andrii.korzh@gmail.com)
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=influxdb
PKG_VERSION:=1.4.2
PKG_RELEASE:=1
PKG_LICENSE:=GPL-3.0+
PKG_MAINTAINER:=Andrii Korzh <andrii.korzh@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/influxdb
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=InfluxDB Server
  URL:=https://www.influxdata.com/
  SUBMENU:=database
endef

define Package/influxdb/description
InfluxDB is used as a data store for any use case involving large amounts of timestamped data,
including DevOps monitoring, application metrics, IoT sensor data, and real-time analytics.
endef

define Package/influxdb/conffiles
/etc/config/influxdb
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/influxdb/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/influxd $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/influxdb.init $(1)/etc/init.d/influxdb

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/influxdb.conf $(1)/etc/config/influxdb
endef

$(eval $(call BuildPackage,influxdb))
