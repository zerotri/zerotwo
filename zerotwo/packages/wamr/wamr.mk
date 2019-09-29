################################################################################
#
# wamr
#
################################################################################

WAMR_VERSION = a522e985f30c12c9c66eda6ff3ab41f493b31b2c
WAMR_SOURCE = wasm-micro-runtime-master.tar.gz
WAMR_SITE = $(call github,intel,wasm-micro-runtime,$(WAMR_VERSION))
WAMR_SUBDIR = core/iwasm/products/linux/

define WAMR_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/core/iwasm/products/linux/libvmlib.so $(TARGET_DIR)/usr/lib/
	$(INSTALL) -D -m 0755 $(@D)/core/iwasm/products/linux/iwasm $(TARGET_DIR)/usr/bin/
endef

$(eval $(cmake-package))
