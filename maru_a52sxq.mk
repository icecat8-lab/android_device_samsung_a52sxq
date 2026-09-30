#
# Copyright (C) 2026 maru
#

# Inherit AOSP core and telephony for Android 17 framework
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device-specific hardware configuration
$(call inherit-product, device/samsung/a52sxq/device.mk)

# Screen resolution for a52sxq
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# maru OS Native Android 17 Identity
PRODUCT_NAME := maru_a52sxq
PRODUCT_DEVICE := a52sxq
PRODUCT_BRAND := maru
PRODUCT_MODEL := Maru OS
PRODUCT_MANUFACTURER := samsung

# System-level branding overrides for maru
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.brand=maru \
    ro.product.model=Maru OS \
    ro.product.name=maru_a52sxq \
    ro.product.device=a52sxq \
    ro.product.manufacturer=samsung

# Vendor Compatibility Mapping
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.fingerprint=samsung/a52sxqxx/a52sxq:14/UP1A.231005.007/A528BXXSBGYI3:user/release-keys \
    ro.bootimage.build.fingerprint=samsung/a52sxqxx/a52sxq:14/UP1A.231005.007/A528BXXSBGYI3:user/release-keys \
    ro.board.platform=sm7325

# Pure Vanilla Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.nocheckin=true \
    ro.setupwizard.mode=OPTIONAL
