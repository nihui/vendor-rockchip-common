LOCAL_PATH := $(call my-dir)
PRODUCT_COPY_FILES += \
		      vendor/rockchip/common/npu/bin/npu_transfer_proxy:vendor/bin/npu_transfer_proxy \
		      vendor/rockchip/common/npu/npu_transfer_proxy.rc:vendor/etc/init/npu_transfer_proxy.rc \

