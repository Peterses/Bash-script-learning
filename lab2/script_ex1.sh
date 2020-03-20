#!bin/bash

# ZADANIE 8

path1=$1
path2=$2

iter=0

for file in $path1/*
do
	lista[iter]=$(basename $file)
	#echo "$(basename $file)"
	iter=$((iter+1))
done

iter2=$((0))

for file2 in $path2/*
do 
	if [ $(basename $file2) == ${lista[$iter2])} ]
	then
		echo "$(basename $file2)"
	fi

iter2=$((iter2+1))

done