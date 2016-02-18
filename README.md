These scripts will get you running batch mode processes on the NRAO AOC cluster in no time.

To get started, look in batch.bash and set the user inputs.

I have set up the code to illustrate batch processing where the user requires some portion of the analysis to take place inside CASA (the most likely use case). To run a demonstration, simply modify ```MYUSERNAME``` and ```WORK_DIR``` in batch.bash, place wrapper.bash and casa_script.py in WORK_DIR, and start batch.bash from anywhere on nmpost-master (e.g. home directory).

Written by Christopher A. Hales.

Please let me know if you make use of these scripts. My email address is shown on my [GitHub homepage](https://github.com/chrishales). You might also consider buying me a lasagna.
