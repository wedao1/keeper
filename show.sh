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
        [[ -n $(ps aux | awk '{print $2}'| grep -w $pid) ]] && isrun="running"
        echo "${dir%.*}: pid:$pid $isrun"
    done
    echo ""
}
killscript(){
    while true
    do
       read -e -p "Enter name to kill script > " name
       [[ ! $name ]] && exit
       sh kill.sh $name
       showlist
    done
}

showlist
killscript

