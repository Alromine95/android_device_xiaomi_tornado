# Copyright (C) 2026 The Android Open Source Project
# SPDX-License-Identifier: Apache-2.0

LOCAL_PATH := device/xiaomi/tornado

# Inherit base products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

PRODUCT_USE_DYNAMIC_PARTITIONS := true
ENABLE_VIRTUAL_AB := true

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    system \
    system_ext \
    vendor \
    product

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# API
PRODUCT_SHIPPING_API_LEVEL := 32

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock

# Boot HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Boot control
PRODUCT_PACKAGES += \
    bootctrl.mt6835 \
    libgptutils \
    libz \
    libcutils

# OTA
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_engine_sideload \
    update_verifier

# Recovery libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libion

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Soong namespace
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.device=$(PRODUCT_RELEASE_NAME)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.postinstall.fstab.prefix=/system
