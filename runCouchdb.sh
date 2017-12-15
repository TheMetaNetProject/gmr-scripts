#!/bin/bash
# ===================================================================
# Start the runinsert slurm batch to insert into couchdb on this machine
# This script expects to be running on mirto1 or mirto2
# $1:  path to directory from current gmr run where runinsert is to be executed
# ===================================================================
echo "$0 starting..."
if [[ ( "$HOST" == "mirto1" ) || ( "$HOST" == "mirto2" ) ]]; then
  if [[ -f "$1/runinsert" ]]; then 
    cd $1
    sh runinsert
    echo "$0: complete."
    exit 0 
  else 
    echo "expecting the directory of a corpus in current gmr run with runinsert file, directory was: $1"
    echo "$0 exiting"
    exit 1
  fi
else 
  echo "$0 must run on mirto1 or mirto2.  Exiting"
  exit 2
fi
