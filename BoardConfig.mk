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

DEVICE_PATH := device/samsung/a52sxq

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic

BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := sm7325
PRODUCT_PLATFORM := sm7325
TARGET_BOOTLOADER_BOARD_NAME := yupik
TARGET_NO_BOOTLOADER := true

# Kernel Configuration & Command Line
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=0 loop.max_part=7 cgroup.memory=nokmem,nosocket firmware_class.path=/vendor/firmware_mnt/image pcie_ports=compat iptable_raw.raw_before_defrag=1 ip6table_raw.raw_before_defrag=1 printk.devkmsg=on
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_BOOT_HEADER_VERSION := 3

# Android 17 OS & Security Patch Level Update
BOARD_OS_VERSION := 17.0.0
BOARD_OS_PATCH_LEVEL := 2026-09

# File Systems
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE      := ext4

BOARD_USES_METADATA_PARTITION        := true
TARGET_USERIMAGES_USE_F2FS           := true
TARGET_USERIMAGES_USE_EXT4           := true

# Partition Sizes
BOARD_DTBOIMG_PARTITION_SIZE                    := 25165824
BOARD_BOOTIMAGE_PARTITION_SIZE                  := 100663296
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE           := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE              := 81788928
BOARD_SUPER_PARTITION_SIZE                      := 10643046400
BOARD_SUPER_PARTITION_GROUPS                    := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE           := 10643046400
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE       := 3000000000
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE       := 400000000
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE      := 1500000000
BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE          := 50000000

BOARD_FLASH_BLOCK_SIZE := 262144

TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm

# Hardware & Qualcomm Flags
BOARD_USES_QCOM_HARDWARE := true
ENABLE_VENDOR_RIL_SERVICE := true

# Display & Graphics
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_HWC2 := true
TARGET_USES_GRALLOC4 := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1
AUDIOSERVER_MULTILIB := 32

# WiFi
BOARD_WLAN_DEVICE := qcwcn
WIFI_DRIVER_DEFAULT := qca_cld3

# Camera Variables
SOONG_CONFIG_NAMESPACES += samsungCameraVars
SOONG_CONFIG_samsungCameraVars += \
    extra_ids \
    needs_sec_reserved_field

SOONG_CONFIG_samsungCameraVars_extra_ids := 54
SOONG_CONFIG_samsungCameraVars_needs_sec_reserved_field := true

# SELinux
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Recovery & Misc
BOARD_HAS_DOWNLOAD_MODE := true
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_RECOVERY_MKBOOTIMG_ARGS += --header_version 2
TARGET_USES_MKE2FS := true
BOARD_USES_FULL_RECOVERY_IMAGE := true

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_SCREEN_DENSITY := 450
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x400000000LL
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# VINTF Manifest & Compatibility Matrices for Android 17
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/manifest_yupik.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/configs/compatibility_matrix.xml
FRAMEWORK_DEVICE_MATRIX_FILES += $(DEVICE_PATH)/configs/framework_compatibility_matrix.xml
