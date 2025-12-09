#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common
include device/samsung/universal8890-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/hero2lte

TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Assert
TARGET_OTA_ASSERT_DEVICE := hero2ltebmc,hero2lteskt,hero2ltektt,hero2ltelgt,hero2ltexx,hero2lte

# Bluetooth
$(call soong_config_set,brcm_libbt,bdroid_buildcfg_include_dir,$(DEVICE_PATH)/bluetooth)

# Init
$(call soong_config_set,libinit,vendor_init_lib,//$(DEVICE_PATH):libinit_hero2lte)

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/universal8890
TARGET_KERNEL_CONFIG := exynos8890-hero2lte_defconfig

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-04-01

# inherit from the proprietary version
include vendor/samsung/hero2lte/BoardConfigVendor.mk
