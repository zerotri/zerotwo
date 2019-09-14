TOP=$(CURDIR)
BUILD=rpi4
OUTPUT_DIR?=$(TOP)/output-$(BUILD)
BR_DIR?=$(TOP)/buildroot
BR2_DL_DIR?=$(TOP)/downloads
export BR2_PACKAGE_OVERRIDE_FILE="$(TOP)/local.mk"
export BR2_EXTERNAL=$(TOP)/zerotwo

all:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR)
%:
	@make -C $(BR_DIR) O=$(OUTPUT_DIR) $@


