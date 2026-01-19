
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENT5_VERSION = 9605edf11a76fbcff6ff3da22c2afcdfd893d91d
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENT5_SITE = git@github.com:meshalalhazmi/ecea5305-assignment3.git
AESD_ASSIGNMENT5_SITE_METHOD = git
AESD_ASSIGNMENT5_GIT_SUBMODULES = YES

define AESD_ASSIGNMENT5_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENT5_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -m 0755 -D $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	 
endef

$(eval $(generic-package))
