#!/bin/bash
# Chris Hales, 3 March 2017
# This script gets called from batch.bash
# Place this script in your work directory as defined in batch.bash

mkdir $WORK_DIR/testing_$JOB_ID
cd $WORK_DIR/testing_$JOB_ID

# -a will auto select virtual frame buffer instead of default 99
xvfb-run -a casa --nogui --nologger -c $WORK_DIR/$CASA_SCRIPT

exit 0
