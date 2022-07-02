#!/usr/bin/env bash
REC_TIME=$(echo $1 | awk -F '/original/data/' '{print $1}')
DATASET=$(echo $1 | awk -F '/original/data/' '{print $2}')
DATA_NAME=$(echo ${DATASET} | awk -F '.raw.h5' '{print $1}')

aws --endpoint $ENDPOINT_URL s3 cp $1 /project/SpikeSorting/Trace.raw.h5

python kilosort_presorting.py

cd /project/SpikeSorting/inter/sorted/kilosort2
rm *.dat
zip -0 ${DATA_NAME}_phy.zip *

# add json later
aws --endpoint $ENDPOINT_URL s3 cp ${DATA_NAME}_phy.zip ${REC_TIME}/derived/kilosort2/${DATA_NAME}_phy.zip

