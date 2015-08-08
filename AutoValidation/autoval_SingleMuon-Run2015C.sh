#!/bin/bash
aklog

echo "Setup environment"

source /afs/cern.ch/cms/cmsset_default.sh

cd /afs/cern.ch/cms/CAF/CMSCOMM/COMM_CSC/CSCVAL/AUTOVAL/CMSSW_7_4_2/src/CSCValidationRunning/AutoValidation

eval `scramv1 runtime -sh`
scram b

echo "Initiate validation script"

#cern-get-sso-cookie --krb -r -u https://cmswbm.web.cern.ch/cmswbm/cmsdb/servlet/RunSummary -o ~/private/ssocookie.txt
./run_cscval.py /SingleMuon/Run2015C-v1/RAW GR_P_V54
