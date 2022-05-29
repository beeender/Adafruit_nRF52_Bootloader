#!/bin/bash

case $1 in
    blackmagic_st)
        ~/repo/stlink-tool/stlink-tool ~/repo/blackmagic/src/blackmagic.bin
        ;;

    flash_bootloader)
        arm-none-eabi-gdb --batch -ex "target extended-remote /dev/ttyACM0" -ex "mon swdp_scan" -ex "file ./_build/build-chelizi_v2/chelizi_v2_bootloader-0.6.4-dirty_s140_6.1.1.hex" -ex "att 1" -ex "mon erase" -ex load
        ;;

    *)
        CFLAGS="-Wno-array-bounds" make BOARD=chelizi_v2
        ;;
esac
