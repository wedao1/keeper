#!/bin/bash
DATADIR=data
help(){
        echo "show list of running scripts"
        exit
}

showlist(){
    echo "running scripts"
    echo ""
    for dir in $(ls ${DATADIR}/pids/)
    do
        pid=$(cat ${DATADIR}/pids/$dir)
        [[ -n $(ps aux | awk '{print $2}'| grep -w $pid) ]] && echo "${dir%.*}: [pid:$pid]"
    done
    echo ""
}
killscript(){
    while true
    do
       read -e -p "Enter name to kill script > " name
       [[ -z $name ]] && exit
       kill $(cat ${DATADIR}/pids/$name.pid)
       rm -rf ${DATADIR}/pids/$name.pid
       rm -rf ${DATADIR}/logs/$name.log
       echo "$name killed"
       showlist
    done
}

showlist
killscript

