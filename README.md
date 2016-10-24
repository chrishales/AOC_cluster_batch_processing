These scripts will get you running batch mode processes on the NRAO Science Operations Center cluster in no time. They may also be useful for other clusters.

To get started, look in batch.bash and set the user inputs.

The code illustrates batch processing where CASA is used for some of the analysis (the most likely use case). To run a demonstration, simply modify ```MYUSERNAME``` and ```WORK_DIR``` in batch.bash, place wrapper.bash and casa_script.py in ```WORK_DIR```, and start batch.bash from anywhere on nmpost-master (e.g. home directory).

Latest version: 1.0 ([download here](https://github.com/chrishales/NRAO-SOC-cluster_batch-processing/releases/latest))

Written by Christopher A. Hales. Released under a BSD 3-Clause License; see LICENSE for details.

If you find these scripts useful, I would appreciate an email saying hi. You might also consider buying me a lasagna.
