#!/bin/bash

echo "Enter a number:"
read num

declare -a array
flag=0
index=0

for (( i=2; `expr $i*$i`<=$num; i++ ));
do
	((index++))
	if [ `expr $num % $i` -eq 0 ];
	then
		factor=$i
		for (( j=2; j<=`expr $factor / 2`; j++ ));
		do
			flag=0
			if [ `expr $factor % $j` -eq 0 ];
			then
				flag=1
				break
			fi
		done
		if [ $flag -eq 0 ];
		then
			echo "$factor is prime factor of $num"
			array[index]=$factor

		fi

	fi

done
echo "array of prime factors:${array[@]}"
echo "size of array is:${#array[@]}"



