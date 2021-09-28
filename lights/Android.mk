LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.light@2.0-service.realme_mt6785
LOCAL_MODULE_STEM := android.hardware.light@2.0-service-mediatek
LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS  := optional

LOCAL_SRC_FILES := \
    service.cpp \
    Light.cpp

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libhidlbase \
    libhardware \
    android.hardware.light@2.0

LOCAL_STATIC_LIBRARIES := \
    libbase \
    libutils

include $(BUILD_EXECUTABLE)
