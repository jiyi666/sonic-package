LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(SDK_DIR)/Android.def

LOCAL_PRELINK_MODULE := false

ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 26 ))" )))
LOCAL_PROPRIETARY_MODULE := true
endif
LOCAL_MODULE := libJZ.AUDIO.SONIC
ALL_DEFAULT_INSTALLED_MODULES += $(LOCAL_MODULE)

LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS := $(CFG_HI_CFLAGS)
LOCAL_CFLAGS += -DLOG_TAG=\"$(LOCAL_MODULE)\"
LOCAL_CFLAGS += -O2 -DTARGET_ARM -D__LINUX_ARM_ARCH__ -DHA_INTERLEAVE

LOCAL_CFLAGS += -DANDROID

LOCAL_SRC_FILES += jz_sonic_wrap.c
LOCAL_SRC_FILES += ./external/sonic/sonic.c

LOCAL_C_INCLUDES += $(EXTSONIC_DIR)
#LOCAL_C_INCLUDES += $(COMMON_UNF_INCLUDE)
#LOCAL_C_INCLUDES += $(MSP_UNF_INCLUDE)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/external/sonic
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES := \
	libutils\
	libcutils

include $(BUILD_SHARED_LIBRARY)
