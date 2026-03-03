################################
#
# gpsfix
#
# output gpsd GPS data to stdout
#
################################

GPSFIX_VERSION = 1.0.1
GPSFIX_SITE = $(call github,ShotSpotter,gpsfix,$(GPSFIX_VERSION))
GPSFIX_DEPENDENCIES = gpsd cli11
GPSFIX_LICENSE = MIT
GPSFIX_LICENSE_FILES = LICENSE
GPSFIX_INSTALL_STAGING = YES
GPSFIX_INSTALL_TARGET = YES

define GPSFIX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef
define GPSFIX_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/bin/gpsfix $(TARGET_DIR)/usr/bin/gpsfix
endef
$(eval $(generic-package))