#
# Copyright (C) 2026 maru
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/a52sxq

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/samsung \
    hardware/qcom/sm7325

# Inherit vendor proprietary blobs for a52sxq
$(call inherit-product-if-exists, vendor/samsung/a52sxq/a52sxq-vendor.mk)

# Device Properties (Galaxy A52s 5G & maru Identity)
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.device.default_name=Galaxy A52s 5G \
    ro.vendor.fingerprint.type=udfps_optical \
    ro.vendor.fingerprint.sensor_location=540|2137|119 \
    ro.vendor.fingerprint.request_touch_event=true

# Partitions & System Configurations
PRODUCT_USE_DYNAMIC_PARTITIONS := true
AB_OTA_UPDATER := false

# Screen Density & AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Native Init & Fstab Files
PRODUCT_PACKAGES += \
    fstab.ramplus \
    init.audio.samsung.rc \
    init.fingerprint.rc \
    init.nfc.samsung.rc \
    init.qcom.rc \
    init.qti.kernel.rc \
    init.qti.media.rc \
    init.ramplus.rc \
    init.samsung.bsp.rc \
    init.samsung.display.rc \
    init.samsung.rc \
    init.target.rc \
    init.vendor.onebinary.rc \
    init.vendor.rilchip.rc \
    init.vendor.rilcommon.rc \
    init.vendor.sensors.rc \
    ueventd.qcom.rc \
    wifi_qcom_wcn6750.rc \
    wifi_sec.rc

# Vendor Shell Scripts
PRODUCT_PACKAGES += \
    init.class_main.sh \
    init.kernel.post_boot.sh \
    init.kernel.post_boot-yupik.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qti.kernel.sh \
    init.qti.media.sh \
    vendor_modprobe.sh \
    init.qti.chg_policy.sh \
    init.qti.qcv.sh

# Audio Packages & Configurations
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.0-impl.samsung-sm7325 \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.r_submix.default \
    audio.usb.default \
    libtinycompress \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcompostprocbundle \
    libvolumelistener

# Bluetooth
PRODUCT_PACKAGES += \
    vendor.qti.hardware.bluetooth_audio@2.0.vendor \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio-impl \
    android.hardware.bluetooth@1.0.vendor

# Camera (Samsung specific HAL)
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.5-service_64.samsung \
    libgrallocusage.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor

# Display & Graphics
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.composer-service \
    vendor.qti.hardware.display.allocator-service \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.default \
    gralloc.default

# Fingerprint & Biometrics (A52s 5G Optical Scanner)
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samsung

# Power & Performance
PRODUCT_PACKAGES += \
    android.hardware.power-service.samsung-libperfmgr

# Sensors & Thermal
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.samsung-multihal \
    android.hardware.thermal@2.0.vendor

# USB & Tethering
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service-qti \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    ipacm \
    IPACM_cfg.xml

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.samsung

# WiFi Packages
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libwifi-hal \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \
    WifiOverlay \
    TetheringConfigOverlay

# Copy local device configurations
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(LOCAL_PATH)/vendor.prop:$(TARGET_COPY_OUT_VENDOR)/build.prop
