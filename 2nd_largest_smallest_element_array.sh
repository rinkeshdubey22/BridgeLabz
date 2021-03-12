#!/bin/bash 

maxNum=10
num=1

while [ $num -le $maxNum ];
do
        number[$num]=$(($RANDOM%999+100))
        ((num++))
done
echo "${number[@]}"

num1=${#number[@]}

for (( i=1; i<=${#number[@]}; i++ ));
do
 	for (( j=1; j<=${#number[@]}; j++ ))
	do
		if [[ ${number[i]} > ${number[j]} ]]
		then
			a=${number[i]}
			number[i]=${number[j]}
			number[j]=$a
		fi
	done
done


echo "secondSmallest =${number[ `expr $num1 - 2` ]}"
echo "secondGreatest=${number[1]}"

