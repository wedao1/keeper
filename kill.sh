#!/bin/bash
DATADIR=data
name=$1
[[ ! $name ]] && exit
kill $(cat ${DATADIR}/pids/$name.pid)
rm -rf ${DATADIR}/pids/$name.pid
rm -rf ${DATADIR}/logs/$name.log
echo "$name killed"
