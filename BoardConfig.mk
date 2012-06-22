# Copyright (C) 2010 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# throughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
# The proprietary variant sets USE_CAMERA_STUB := false, this way
# we use the camera stub when the vendor tree isn't present, and
# the true camera library when the vendor tree is available.

# Inherit from the proprietary version if exists
#-include vendor/huawei/u8800/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a8
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_BOARD_PLATFORM := msm7x30
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := u8800
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_RADIOIMAGE := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USE_QCOM_PMEM := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 6220

# Kernel
BUILD_KERNEL := true
TARGET_KERNEL_CONFIG := u8800-perf_defconfig
TARGET_KERNEL_SOURCE := kernel/huawei/u8800
KERNEL_EXTERNAL_MODULES:
	cp device/huawei/u8800/prebuilt/wlan.ko $(KERNEL_MODULES_OUT)
TARGET_KERNEL_MODULES := KERNEL_EXTERNAL_MODULES

BOARD_KERNEL_CMDLINE := console=ttyDCC0 androidboot.hardware=qcom
BOARD_INSTALLER_CMDLINE := $(BOARD_KERNEL_CMDLINE)
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_PAGESIZE := 4096

# Audio
BOARD_PROVIDES_LIBAUDIO := true

# Camera
USE_CAMERA_STUB := false
BOARD_CAMERA_USE_GETBUFFERINFO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# FM
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := u8800
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_GPS_LIBRARIES := libloc_api

# Graphics
TARGET_USES_GENLOCK := true
BOARD_EGL_CFG := device/huawei/u8800/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60
TARGET_FORCE_CPU_UPLOAD := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# RIL
BOARD_PROVIDES_LIBRIL := true

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_ARG := ""
WIFI_EXT_MODULE_PATH :=  "/system/lib/modules/librasdioif.ko"
WIFI_EXT_MODULE_NAME :=  "librasdioif"
WIFI_EXT_MODULE_ARG  := ""
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/wlan"
WIFI_DRIVER_FW_PATH_AP  := "/system/etc/firmware/wlan"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
BOARD_WLAN_DEVICE := qcwcn


# File System
TARGET_USERIMAGES_USE_EXT4 := true

# For bootmenu - not needed right now.
#BOARD_USES_BOOTMENU := true
BOARD_MMC_DEVICE := /dev/block/mmcblk0
BOARD_DATA_DEVICE := /dev/block/mmcblk0p13
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p14
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000 #10MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000 #10MB
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456 #256MB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824 #1GB
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880 #5MB
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728 #128MB
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 4096000 #4000KB
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Recovery
BOARD_CUSTOM_GRAPHICS := ../../../device/huawei/u8800/recovery/graphics.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_TOUCH_RECOVERY := true

# Custom releasetools for old partition table.
TARGET_PROVIDES_RELEASETOOLS := true
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/huawei/u8800/releasetools/ota_from_target_files

# ETC
TARGET_SPECIFIC_HEADER_PATH := device/huawei/u8800/include

TARGET_COMPRESS_MODULE_SYMBOLS := false
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
BOARD_ALWAYS_INSECURE := true

