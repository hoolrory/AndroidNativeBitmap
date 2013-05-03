LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libskia
LOCAL_SRC_FILES := AndroidLibs/libskia.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libandroid_runtime
LOCAL_SRC_FILES := AndroidLibs/libandroid_runtime.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	NativeBitmapJNI.cpp

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/AndroidSource/external/skia/include/core \
	$(LOCAL_PATH)/AndroidSource/frameworks/base/core/jni/android/graphics \
	$(LOCAL_PATH)/AndroidSource/frameworks/native/include \
	$(LOCAL_PATH)/AndroidSource/system/core/include

LOCAL_CFLAGS += -Wall -Wno-multichar -DHAVE_PTHREADS  -DTARGET_API=17

LOCAL_SHARED_LIBRARIES := \
		libskia \
      libandroid_runtime

LOCAL_MODULE := nativeBitmap

LOCAL_LDLIBS := -llog

include $(BUILD_SHARED_LIBRARY)