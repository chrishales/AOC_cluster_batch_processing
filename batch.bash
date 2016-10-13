#!/bin/bash
# Chris Hales, 29 April 2016
# For use on NRAO Socorro cluster
# May be useful elsewhere
# Released under a BSD 3-Clause License, see LICENSE for details

# Start this executable from anywhere on nmpost-master (eg home directory)

#### USER INPUTS ##########
MYUSERNAME=chales
NUM_JOBS=3          # set number of jobs you need processed, regulate behaviour using $JOB_ID in WRAPPER_SCRIPT
MAX_PROCESSES=32    # recommended value 32. Note: Socorro cluster currently has 16 cores per node
MEMORY_LIMIT=3800mb # memory to reserve per process
MAIL_OPTIONS=a      # when do you want mail? a=abort, b=beginning, e=exit
WAIT_TIME=120s      # interval to check system for progress of batch processing
WORK_DIR=/PathToMyFiles
WRAPPER_SCRIPT=wrapper.bash                 # place this executable in your WORK_DIR
CASA_SCRIPT=casa_script.py                  # place this script in your WORK_DIR
RUN_TIME_FILE='batch_start_end_times.txt'   # this file will be generated and placed in your WORK_DIR
###########################

date > $WORK_DIR/$RUN_TIME_FILE
export WORK_DIR
export CASA_SCRIPT

i=1
while [ $i -le $NUM_JOBS ]; do
    export JOB_ID=$i
    
    # get number of finished processes
    NUM_FINISHED=`ls -l $WORK_DIR/$WRAPPER_SCRIPT.o* 2> /dev/null | wc -l`
    
    # don't submit more jobs than there are available cores
    let k=$i-$NUM_FINISHED
    while [ $k -gt $MAX_PROCESSES ]; do
        sleep $WAIT_TIME
        NUM_FINISHED=`ls -l $WORK_DIR/$WRAPPER_SCRIPT.o* 2> /dev/null | wc -l`
        let k=$i-$NUM_FINISHED
    done
    
    echo "job $i/$NUM_JOBS starting"
    # send each job to a single core (ppn=1) on a single node (nodes=1)
    /opt/services/torque/bin/qsub -l nodes=1:ppn=1 -l mem=$MEMORY_LIMIT,pmem=$MEMORY_LIMIT -V \
                                  -d $WORK_DIR -m $MAIL_OPTIONS $WORK_DIR/$WRAPPER_SCRIPT
    
    let i+=1
done

# once no more jobs running, remove qsub log files
while [ `qstat -nu $MYUSERNAME | grep $WRAPPER_SCRIPT | wc -l` -gt 0 ]; do
    sleep $WAIT_TIME
done
rm $WORK_DIR/$WRAPPER_SCRIPT.e*
rm $WORK_DIR/$WRAPPER_SCRIPT.o*

date >> $WORK_DIR/$RUN_TIME_FILE

exit 0
