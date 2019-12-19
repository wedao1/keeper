#!/bin/bash
DATADIR=data

for dir in $(ls ${DATADIR}/pids/)
do
        pid=$(cat ${DATADIR}/pids/$dir)
        [[ -n $(ps aux | awk '{print $2}'| grep -w $pid) ]] && sh kill.sh ${dir%.*}
done
