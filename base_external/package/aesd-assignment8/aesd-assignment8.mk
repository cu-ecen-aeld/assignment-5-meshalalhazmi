
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENT8_VERSION = 71e6883d4b610b78aecfdc2a3e72952b02187f7b
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENT8_SITE = git@github.com:meshalalhazmi/ecea5305-assignment3.git
AESD_ASSIGNMENT8_SITE_METHOD = git
AESD_ASSIGNMENT8_GIT_SUBMODULES = YES

define AESD_ASSIGNMENT8_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef
AESD_ASSIGNMENT8_MODULE_SUBDIRS = aesd-char-driver

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENT8_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -m 0755 -D $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S98aesdsocket
	$(INSTALL) -m 0755 -D $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/aesdchar_load
	$(INSTALL) -m 0755 -D $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/aesdchar_unload
	$(INSTALL) -m 0755 -D $(@D)/aesd-char-driver/aesdchar-start-stop $(TARGET_DIR)/etc/init.d/S97aesdchar

endef
$(eval $(kernel-module))
$(eval $(generic-package))
