#!/usr/bin/bash
# to use the script, https://github.com/hredan/eep-build-action must be cloned before.
# set path in BUILD_ACTIOM_DIR to the path of the cloned repository.
# With GitBash the scripts are working also on Windows.

BUILD_ACTION_DIR="../eep-build-action/"
SKETCH_NAME="ESP_Blink"
CORE="esp32"
BOARD="d1_mini32"
CORE_VERSION=""
CPU_F="160"

URL=$(git remote get-url origin)
HASH=$(git rev-parse HEAD)


$BUILD_ACTION_DIR/build_sketch.sh -s $SKETCH_NAME -c $CORE -b $BOARD -f $CPU_F
$BUILD_ACTION_DIR/create_build_info.sh -r $URL -s $HASH
$BUILD_ACTION_DIR/create_eep_package.sh -s $SKETCH_NAME -c $CORE -b $BOARD
