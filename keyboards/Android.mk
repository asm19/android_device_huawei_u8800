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

# This makefile performs build time validation of framework keymap files.

LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/common.mk

# Validate all key maps.
include $(CLEAR_VARS)

validatekeymaps := $(HOST_OUT_EXECUTABLES)/validatekeymaps$(HOST_EXECUTABLE_SUFFIX)
files := \
	$(foreach file,$(keylayouts),$(LOCAL_PATH)/$(file)) \
	$(foreach file,$(keycharmaps),$(LOCAL_PATH)/$(file)) \
	$(foreach file,$(keyconfigs),$(LOCAL_PATH)/$(file))

LOCAL_MODULE := validate_device_keymaps
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := validatekeymaps

validate_device_keymaps: $(files)
	$(hide) $(validatekeymaps) $(files)

include $(BUILD_PHONY_PACKAGE)
