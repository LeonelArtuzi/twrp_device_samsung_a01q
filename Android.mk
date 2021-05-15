LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE), a01q)
	include $(call all-makefiles-under, $(LOCAL_PATH))
endif
