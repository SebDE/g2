# ----------------------------------------------------------------------------
# This file is part of the Synthetos g2core project


# To compile:
#   make BOARD=BitDue

# You can also choose a CONFIG from boards.mk:
#   make CONFIG=BitDueLathe BOARD=BitDue



##########
# BOARDs for use directly from the make command line (with default settings) or by the CONFIGS above.

ifeq ("$(BOARD)","bitduea")
    BASE_BOARD=bitdue
    DEVICE_DEFINES += MOTATE_BOARD="bitduea"
    DEVICE_DEFINES += SETTINGS_FILE=${SETTINGS_FILE}
endif


##########
# The general g2v9 BASE_BOARD.

ifeq ("$(BASE_BOARD)","bitdue")
    _BOARD_FOUND = 1

    FIRST_LINK_SOURCES += $(sort $(wildcard ${MOTATE_PATH}/Atmel_sam_common/*.cpp)) $(sort $(wildcard ${MOTATE_PATH}/Atmel_sam3x/*.cpp))

    # Set CHIP and export it for GDB to see
    CHIP = SAM3X8E
    export CHIP
    CHIP_LOWERCASE = sam3x8e

    BOARD_PATH = ./board/bitdue
    SOURCE_DIRS += ${BOARD_PATH} device/step_dir_driver

    PLATFORM_BASE = ${MOTATE_PATH}/platform/atmel_sam

    include $(PLATFORM_BASE).mk
endif
