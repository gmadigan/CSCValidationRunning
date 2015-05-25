# CSCValidationRunning
Repository to setup the latest version of CSCValidation to be run automatically on CAF

## Setup

Setup a new release
```
cmsrel CMSSW_7_4_2 # or current CMSSW version
cd CMSSW_7_4_2/src
cmsenv
git cms-init
```

Clone the repository
```
git clone git@github.com:dntaylor/CSCValidationRunning.git
```

Run the setup script
```
cd CSCValidationRunning
./setup.sh
```

## Starting cron job

To run a cron job on afs you must use acrontab. The current version crontab script is in
[AutoValidation/autoval.cron](AutoValidation/autoval.cron). Make certain you consult with others to make 
sure we don't have multiple cron jobs running (Devin Taylor and Benjamin Knapp).
```
acrontab <autoval.cron
acrontab -l
```

## Individual running

The primary submission script can be found in [AutoValidation/run_cscval.py](AutoValidation/run_cscval.py).
For documentation on the script run:
```
./run_cscval.py -h
```

This script can run over multiple event content types (FEVT and RAW). You must simply pass it the 
dataset name and global tag. The script can be run in single run mode (`-rn RUNNUMBER`) or all runs mode. 
It will then check whether a run has been processed yet and whether CSCs were in the run and submit the 
job to the CAF LSF batch queues. After the job is finished, the outputs are stored on EOS. You can then 
produce the images and pass the output to the website with the `--retrieveOutput` option.

The script checks the local folder for what runs have been processed: `AutoValidation/STREAMNAME`. The 
`STREAMNAME` option can include `ExpressCosmics`, `Cosmics`, `SingleMu`, and `DoubleMu`.

## Templates

Templates for producing the scripts to submit to bash are still found on the CSC CAF space. These will be
moved to this repository later.
