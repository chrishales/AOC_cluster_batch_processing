# Chris Hales, 18 February 2016
# This script gets called from wrapper.bash
# Place this script in your work directory as defined in batch.bash

JOB_ID=os.environ['JOB_ID']

os.system('touch testfile'+str(JOB_ID)+'.txt')
casalog.post('hi there')
