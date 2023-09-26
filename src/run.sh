#!/usr/bin/env bash

REC_TIME=$(echo $1 | awk -F '/original/data/' '{print $1}')
DATASET=$(echo $1 | awk -F '/original/data/' '{print $2}')
DATA_NAME_FULL=$(echo ${DATASET} | awk -F '.raw.h5' '{print $1}')

if [[ $DATA_NAME_FULL == *"/"* ]]; then
    CHIP_ID=$(echo $DATA_NAME_FULL | awk -F '/' '{print $1}')"/"
    DATA_NAME=$(echo $DATA_NAME_FULL | awk -F '/' '{print $2}')
else
    CHIP_ID=""
    DATA_NAME=${DATA_NAME_FULL}

fi

aws --endpoint $ENDPOINT_URL s3 cp $1 /project/SpikeSorting/Trace.raw.h5

python kilosort2_maxwell.py

cd /project/SpikeSorting/inter/sorted/kilosort2
aws --endpoint $ENDPOINT_URL s3 cp recording.dat s3://braingeneersdev/cache/${DATA_NAME}/recording.dat
aws --endpoint $ENDPOINT_URL s3 cp temp_wh.dat s3://braingeneersdev/cache/${DATA_NAME}/temp_wh.dat
rm *.dat
zip -0 ${DATA_NAME}_phy.zip *

# add json later
aws --endpoint $ENDPOINT_URL s3 cp ${DATA_NAME}_phy.zip ${REC_TIME}/derived/kilosort2/${CHIP_ID}${DATA_NAME}_phy.zip
