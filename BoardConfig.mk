#
# Copyright 2019 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

PLATFORM_PATH := device/samsung/a01q

ALLOW_MISSING_DEPENDENCIES := true

TARGET_NO_BOOTLOADER := true 
TARGET_BOOTLOADER_BOARD_NAME :=  SRPSI03D004
TARGET_BOARD_PLATFORM := msm8937
TARGET_BOARD_PLATFORM_GPU := qcom-adreno505

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2578075648
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x550647000
BOARD_CACHEIMAGE_PARTITION_SIZE := 146800640
#BOARD_PERSISTIMAGE_PARTITION_SIZE := 0x2000000
#BOARD_VENDORIMAGE_PARTITION_SIZE := 410492928
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

#TODO
# Cmdline
BOARD_KERNEL_CMDLINE := console=null androidboot.console=ttyMSM0 androidboot.hardware=qcom  msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 
BOARD_KERNEL_CMDLINE += androidboot.usbconfigfs=true loop.max_part=7 printk.devkmsg=on
#BOARD_KERNEL_CMDLINE += user_debug=30


# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 3494212044
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 3494212044
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm



#TODO

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_SOURCE := kernel/samsung/a01q
#TARGET_KERNEL_CONFIG := samsung/a01q_eur_open_defconfig
#TARGET_KERNEL_CROSS_COMPILE_PREFIX :=x-special/nautilus-clipboard

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_PREBUILT_KERNEL := $(PLATFORM_PATH)/Image.gz-dtb
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS :=  --kernel_offset 0x00008000 --ramdisk_offset 0x02000000 --second_offset 0x00f00000 --tags_offset 0x01e00000
#CONFIG_BUILD_ARM64_DT_OVERLAY=y
#TARGET_KERNEL_CLANG_COMPILE := true

# Fstab
#TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/recovery/root/etc/recovery.fstab


# QCOM Stuff
BOARD_USES_QCOM_HARDWARE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

#TODO
# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2


# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USES_MKE2FS := true
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_INCLUDE_RECOVERY_DTBO := true


# Crypto
PLATFORM_SECURITY_PATCH := 2025-12-31
VENDOR_SECURITY_PATCH := 2025-12-31
PLATFORM_VERSION := 16.1.0
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := true


# System as root
BOARD_ROOT_EXTRA_FOLDERS := cache carrier dqmdbg efs keydata keyrefuge omr optics prism spu
BOARD_SUPPRESS_SECURE_ERASE := true

#TODO
# TWRP Stuff
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TW_THEME := portrait_hdpi
TW_USE_TOOLBOX := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_INCLUDE_REPACKTOOLS := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_EXTRA_LANGUAGES := true
TW_NO_SCREEN_BLANK := true
TW_EXCLUDE_TWRPAPP := true
TW_NO_SCREEN_TIMEOUT  := true
TW_HAS_USB_STORAGE := true
TW_NO_USB_STORAGE := false
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_Y_OFFSET := 57
TW_H_OFFSET := -57
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
TW_INCLUDE_NTFS_3G := true


TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 255



TW_DEVICE_VERSION := Leonel-64bit
