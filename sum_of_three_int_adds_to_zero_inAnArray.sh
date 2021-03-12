#!/bin/bash

arr=([0]=0 [1]=-1 [2]=2 [3]=-3 [4]=1)
len=${#arr[@]}
echo "Size of array is:$len"
echo "Array elements are:${arr[@]}"

found='false'
for (( i=0; i<=`expr $len - 2`; i++ ));
do
	for (( j=`expr $i + 1`; j<=`expr $len - 1`; j++  ));
	do
		for (( k=`expr $j + 1`; k<$len; k++ ));
		do
			if [[  `expr ${arr[i]} + ${arr[j]} + ${arr[k]}` == 0 ]];
			then
				echo "Addition of these elements are 0 = ${arr[i]},${arr[j]},${arr[k]}"
				found='true'
			fi
		done
	done
done
if [ $found == "false" ];
then
	echo "not exist"
fi
