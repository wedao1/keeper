#!/bin/bash
function mdir(){
   if [ ! -d ${1}  ];then
      mkdir -p ${1}
   fi
}
help(){
        echo "usage: $0 -a 'name' -b 'command'"
        echo "example: * * * * * cd ${PWD} && $0 -a 'delete_order' -b 'docker exec -i docker_im_php_1 php yii delete/order'"
        exit
}

while getopts "a:b:c" arg 
do
    case $arg in
        a)
            name=$OPTARG
            ;;
        b)
            cmd=$OPTARG
            ;;
        ?)  
            help
            ;;
    esac
done

if [ $# -lt 4 ];then
        help
fi
echo "start $name : $cmd"
[[ -z ${cmd} ]] && help
[[ -z ${name} ]] && help

###start
INTERVAL=1

DATADIR=data
LOGPATH=${DATADIR}/logs/${name}.log
PIDPATH=${DATADIR}/pids/${name}.pid
mdir ${DATADIR}
mdir ${DATADIR}/logs
mdir ${DATADIR}/pids
#run=`nohup ${cmd} >> ${LOGPATH} 2>&1& echo $! > ${PIDPATH}`

echo ${run}
#while true
#do    
#echo /proc/`cat ${PIDPATH}`

#PID=$(cat ${PIDPATH})
#PID_EXIST=$(ps aux | awk '{print $2}'| grep -w $PID)

if [[ ! $(cat ${PIDPATH}) ]] || [[ ! $(ps aux | awk '{print $2}'| grep -w $(cat ${PIDPATH})) ]]; then
        nohup ${cmd} >> ${LOGPATH} 2>&1& echo $! > ${PIDPATH}
        echo "start script. (pid:`cat ${PIDPATH}`) [$(date "+%Y-%m-%d %H:%M:%S")]"
else
        echo "scrpit is running. (pid:`cat ${PIDPATH}`) [$(date "+%Y-%m-%d %H:%M:%S")]"
fi
#    sleep ${INTERVAL}
#done
