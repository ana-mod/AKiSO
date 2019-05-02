#!/bin/bash
# use ./proc.sh | sort -n   to display in PID ascending order

FORMAT="%-8s  %-32s  %-8s\n"

printf "$FORMAT" "PID" "Name" "Opened Files"
echo ""

FILES=/proc/* 

for f in $FILES
do

    if [[ $f = *[0-9] ]]
    then
	PID=`awk 'NR==6{print$2}' $f/status`        
	NAME=`awk 'NR==1{print$2}' $f/status`        
	NFILES=$[`ls -l $f/fd | wc -l`-1]
        printf "$FORMAT" $PID $NAME $NFILES
    fi
done
