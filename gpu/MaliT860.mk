# $(info 'in MaliT860.mk')
# $(info TARGET_BOARD_PLATFORM_GPU:$(TARGET_BOARD_PLATFORM_GPU) )
# $(info TARGET_ARCH:$(TARGET_ARCH) )

ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali-t860)
DRIVER_PATH := kernel/drivers/gpu/arm/midgard/midgard_kbase.ko
HAS_BUILD_KERNEL := $(shell test -e $(DRIVER_PATH) && echo true)

ifneq ($(strip $(HAS_BUILD_KERNEL)), true)
# Move to Android.mk

PRODUCT_COPY_FILES += \
	vendor/rockchip/common/gpu/MaliT860/lib/modules/mali_kbase.ko:$(TARGET_COPY_OUT_VENDOR)/lib/modules/mali_kbase.ko
else
PRODUCT_COPY_FILES += \
	$(DRIVER_PATH):$(TARGET_COPY_OUT_VENDOR)/lib/modules/mali_kbase.ko
endif
endif

PRODUCT_PACKAGES += \
	libGLES_mali

ifeq ($(strip $(ENABLE_STEREO_DEFORM)), true)
PRODUCT_COPY_FILES += \
	vendor/rockchip/common/gpu/libs/libGLES.so:system/lib/egl/libGLES.so
endif
