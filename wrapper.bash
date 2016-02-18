#!/bin/bash
# Chris Hales, 18 February 2016
# This script gets called from batch.bash
# Place this script in your work directory as defined in batch.bash

mkdir $WORK_DIR/testing_$JOB_ID
cd $WORK_DIR/testing_$JOB_ID

xvfb-run casa --nogui --nologger -c $WORK_DIR/$CASA_SCRIPT

exit 0
