#!/bin/bash
########################################################################
#This scripts is checking your host system: the cpu ,i/o,mem,network,
#processes stat.
#  vision 1.1 Bate
#  Write by skate
#  Update by Poisson
#If you have some advise about it ,you can mail :gaosongbo@panguso.com
########################################################################
logdir=/data0/search/sysLoadLog
cd $logdir
#make the local language is chinese
#export LANG=zh_CN
removedate=`date +%d`
curdate=`date +%H`
dateOFfile=`date +"%Y%m%d%H"`
logcpuuse=$logdir/cpuuse"."$dateOFfile".log"
logcpuload=$logdir/cpuload"."$dateOFfile".log"
logioload=$logdir/ioload"."$dateOFfile".log"
lognetworkload=$logdir/networkload"."$dateOFfile".log"
logsysprocess=$logdir/sysprocess"."$dateOFfile".log"
logmemuse=$logdir/memuse"."$dateOFfile".log"
lognetsession=$logdir/netsession"."$dateOFfile".log"
debuglog=$logdir/debuglog"."$dateOFfile".log"
################################
#ͳ��cpu��ʹ������Ϣ
#����1Сʱ
#cpuuse(){
#fuck(){
#    echo "begin cpuuse"
#    datenow=`date +"%Y%m%d%H%M%S"`
#    if [ -f $logcpuuse ]
#    then
#        echo $datenow,$logcpuuse >> $debuglog
#    else
#        echo $datenow > $logcpuuse
#    #    echo $datenow >> $debuglog
#        vmstat 30 120 | grep -v "p\|r">> $logcpuuse
#   fi
#}
###############################
#ͳ��cpu�ĸ�����Ϣ
###############################
cpuload() {
    for((i=1;i<120;i++));
    do
        datenow=`date +"%Y%m%d%H%M%S"`
        if [ -f $logcpuload ]
            then
                uptime  >> $logcpuload
            else
                #echo $datenow > $logcpuload
                uptime >> $logcpuload
        fi
        sleep 30
    done
}

################################
#ͳ��io��ʹ����
#����1Сʱ
################################

io() {
    datenow=`date +"%Y%m%d%H%M%S"`
    if [ -f $logioload ]
    then
        echo $datenow,$logioload >> $debuglog
    else
        echo $datenow > $logioload
        echo $datenow >> $debuglog
        iostat -x -k 30 120 >> $logioload
    fi
}

################################
#ͳ��Mem��ʹ����
#����1Сʱ
################################

mem() {
    for((i=1;i<120;i++));
    do
        datenow=`date +"%Y%m%d%H%M%S"`
        if [ -f $logmemuse ]
            then
                #echo $datenow >> $logmemuse
                free -m >> $logmemuse
            else
                echo $datenow > $logmemuse
                free -m >> $logmemuse
        fi
        sleep 30
    done
}


others(){
    ###############################
    #�鿴������������tcpЭ��
    ###############################
    if [ -f $lognetsession ]
    then
    date +"%D %r" >> $lognetsession
    netstat -an | grep -E "^(tcp)" | cut -c 74- | sort | uniq -c | sort -n >> $lognetsession
    else
    date +"%D %r" >> $lognetsession
    netstat -an | grep -E "^(tcp)" | cut -c 74- | sort | uniq -c | sort -n >> $lognetsession
    fi
   
   
    ###################################
    #ͳ��ϵͳ����������Ϣ
    ###################################
    if [ -f $logsysprocess ]
    then
    date +"%D %r" >> $logsysprocess
    eysnum=`ps aux | wc -l`
    javanum=` ps -ef |grep java | grep -v grep |wc -l`
    echo "processes of system is: $sysnum" >> $logsysprocess
    echo "processes of java is: $javanum" >> $logsysprocess
    else
   
    date +"%D %r" > $logsysprocess
    sysnum=`ps aux | wc -l`
    javanum=` ps -ef |grep java | grep -v grep |wc -l`
    echo "processes of system is: $sysnum" >> $logsysprocess
    echo "processes of javanum is: $javanum" >> $logsysprocess
    fi
   
   
    #################################
    #ͳ�����縺�ص���Ϣ
    ################################
   
    if [ -f $lognetworkload ]
    then
    date +"%D %r" >> $lognetworkload
    sar -n DEV 1 3| grep eth0 >> $lognetworkload
   
    else
    date +"%D %r" > $lognetworkload
    sar -n DEV 1 3|head -3 |tail -1 >> $lognetworkload
    sar -n DEV 1 3| grep eth0 >> $lognetworkload
    fi
}

case "$1" in
    cpuuse)
        cpuuse
        RETVAL=$?
        ;;
    cpuload)
        cpuload
        RETVAL=$?
        ;;
    io)
        io
        RETVAL=$?
        ;;
    mem)
        mem
        RETVAL=$?
        ;;
    others)
        others
        RETVAL=$?
        ;;
    *)
        echo $"Usage: $0 {cpuuse|cpuload|io|mem|others}"
        exit 1
        ;;
esac

exit 0
