#!/bin/bash -x

isPresent=1;
isPartTime=2;
declare -A empDailyWage
PerHourWage=100;
daysOfMonth=20;
monthlyWorkingHours=30;
monthlyWage=0;
hours=0;
totalEmpdays=0;
function getWorkingHours(){
	case $1 in
		$isPresent)
			empHours=8;;
		$isPartTime)
			empHours=4;;
		*)
			empHours=0;;
	esac
		echo $empHours
}
function calculateWage(){
wage=$(( $1 * $PerHourWage ))
echo $wage
}

while [[ $totalEmpdays -lt $daysOfMonth && $hours -lt $monthlyWorkingHours ]]
do
	((totalEmpdays++))
	randomEmp=$((RANDOM%3));
	echo $randomEmp
		workHours=$( getWorkingHours $randomEmp )
		dailyWage=$( calculateWage $workHours )
		echo $dailyWage
		empDailyWage[$totalEmpdays]=$dailyWage
		hours=$(( $hours + $workHours ))
done
		monthlyWage=$(calculateWage $hours)
		echo "monthly salary is $monthlyWage"
		echo ${!empDailyWage[@]}
		echo ${empDailyWage[@]}
