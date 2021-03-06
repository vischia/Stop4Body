#!/bin/bash

. setupJSONs.sh
. setupPaths.sh

INPUT=~/local-area/Stop4Body/nTuples_v2017-06-05_SysVar
OUTPUT=~/local-area/Stop4Body/FakeClosure/
#OUTPUT=./test/

if [[ -d ${INPUT} ]] ; then
  for deltaM in 10 20 30 40 50 60 70 80; do
    mkdir -p ${OUTPUT}/DeltaM${deltaM}/

    JSONFILE=fake_bdt${deltaM}.json
    makePlots --doSummary --lumi 1 --json ${JSON_PATH}/plot2016_closure.json --outDir ${OUTPUT}/DeltaM${deltaM} --inDir ${INPUT}_bdt${deltaM}/ --dofakeclosure --variables ${JSONFILE} --cuts ${JSONFILE} --suffix bdt
  done
fi
