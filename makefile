# دعم كل المعالجات القديمة والحديثة
ARCHS = arm64 arm64e
# دعم من iOS 12 وصولاً لأحدث إصدار
TARGET := iphone:clang:latest:12.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BackupTweak

BackupTweak_FILES = Tweak.x
BackupTweak_CFLAGS = -fobjc-arc
BackupTweak_FRAMEWORKS = UIKit Foundation Security

include $(THEOS_MAKE_PATH)/tweak.mk
