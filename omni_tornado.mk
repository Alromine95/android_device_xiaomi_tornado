#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from tornado device
$(call inherit-product, device/xiaomi/tornado/device.mk)

PRODUCT_DEVICE := tornado
PRODUCT_NAME := omni_tornado
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := tornado
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="miodm_tornado_global-user 13 TP1A.220624.014 OS3.0.1.0.WPOMIXM release-keys"

BUILD_FINGERPRINT := Redmi/tornado_global/tornado:13/TP1A.220624.014/OS3.0.1.0.WPOMIXM:user/release-keys
