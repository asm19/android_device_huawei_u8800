## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := U8800

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-480x800

# Inherit device configuration
$(call inherit-product, device/huawei/u8800/full_u8800.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := u8800
PRODUCT_NAME := cm_u8800
PRODUCT_BRAND := Huawei
PRODUCT_MODEL := U8800
PRODUCT_MANUFACTURER := Huawei

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=u8800 \
	BUILD_DISPLAY_ID="IMM76I" \
	BUILD_FINGERPRINT=huawei/u8800:4.0.4/IMM76I/223133:userdebug/test-keys \
	PRIVATE_BUILD_DESC="huawei-user 4.0.4 IMM76I 223133 test-keys" \
	BUILD_NUMBER=223133
