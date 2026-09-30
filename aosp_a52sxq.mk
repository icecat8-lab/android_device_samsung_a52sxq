#
# Copyright (C) 2026 maru
#

# Inherit AOSP core and telephony
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/a52sxq/device.mk)

# Screen resolution
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Device identifiers
PRODUCT_NAME := aosp_a52sxq
PRODUCT_DEVICE := a52sxq
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A528B
PRODUCT_MANUFACTURER := samsung

PRODUCT_SHIPPING_API_LEVEL := 30

# Build prop overrides (Android 14 - A528BXXSBGYI3)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint="samsung/a52sxqxx/a52sxq:14/UP1A.231005.007/A528BXXSBGYI3:user/release-keys" \
    BuildDesc="a52sxqxx-user 14 UP1A.231005.007 A528BXXSBGYI3 release-keys"
