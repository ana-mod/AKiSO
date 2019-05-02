#!/bin/sh
tput clear
echo "obciążenie systemu:"

#wyswietlanie skali
for i in `seq 0 15`
do
	x=`awk "BEGIN {print 0.0+0.1*$i}"`
	printf "%.1f " $x
done

echo ""

s=`awk '{ print $1*10 }' /proc/loadavg` 
s=`printf "%.0f" $s` #pobieranie zaokraglonej czesci dziesietnej obciazania

for i in `seq 0 15`
do
	if [ "$i" -gt "$(($s-1))" ]
then
	break
fi
	printf "####" #wyswietlanie #### dla kazdej 0,1 obciazenia

done
echo ""

#echo "`awk '{ print $1 }' /proc/loadavg`"

sleep 1

t=`awk '{ print $1*10 }' /proc/loadavg`
t=`printf "%.0f" $t`
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($t-1))" ]
then
	break
fi
	printf "####"

done
#echo "`awk '{ print $1 }' /proc/loadavg`"
echo ""
sleep 1 
u=`awk '{ print $1*10 }' /proc/loadavg`
u=`printf "%.0f" $u`
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($u-1))" ]
then
	break
fi
	printf "####"

done
echo ""

#echo "`awk '{ print $1 }' /proc/loadavg`"
sleep 1

w=`awk '{ print $1*10 }' /proc/loadavg`
w=`printf "%.0f" $w`
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($w-1))" ]
then
	break
fi
	printf "####"

done
echo ""

#echo "`awk '{ print $1 }' /proc/loadavg`"
sleep 1

x=`awk '{ print $1*10 }' /proc/loadavg`
x=`printf "%.0f" $x`
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($x-1))" ]
then
	break
fi
	printf "####"

done
echo ""

#echo "`awk '{ print $1 }' /proc/loadavg`"
sleep 1

while true
do
s=$t #przesuwanie wynikow o 1 w gore
t=$u
u=$w
w=$x
x=`awk '{ print $1*10 }' /proc/loadavg`
x=`printf "%.0f" $x`

for i in `seq 1 5`
do
tput el1; tput el; tput cuu1 #usuwanie 5 linii w gore
done
tput el1; tput el
tput cup 2 0 #ustawianie kursora na poczatku 
#x=`printf "%.0f" $x`
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($s-1))" ]
then
	break
fi
	printf "####"
done
echo ""
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($t-1))" ]
then
	break
fi
	printf "####"
done
echo ""
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($u-1))" ]
then
	break
fi
	printf "####"
done
echo ""
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($w-1))" ]
then
	break
fi
	printf "####"
done
echo ""
for i in `seq 0 15`
do
	if [ "$i" -gt "$(($x-1))" ]
then
	break
fi
	printf "####"
done
echo ""
sleep 1
done
