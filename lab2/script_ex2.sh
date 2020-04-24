#!/bin/bash


# Exercise 12

path1=$1
path2=$2

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

if [ ! -f "$path2" ] || [ ! -w "$path2" ]
then
    echo "$path2 not exist or you dont have privileges"
    exit 1
fi

list="$(cat $path2)"


for var in $list # lista - zawartosc pliku
do

	for folder_file in $path1/*
	do

	if [[ $(basename "$var") == $(basename "$folder_file") ]] && [ -x $folder_file ]
	then
		echo "Deleting file if it's executable and has same name"
		$(rm $folder_file)
	fi

	#echo "$folder_file"

	if [ -d $folder_file ]
	then
		for files in $folder_file/*
		do
			if [[ $(basename $files) == $(basename $path2) ]]
			then
				for files2 in $folder_file/*
				do
					for var2 in $list
					do
						#echo "$files2"
						#echo "$var2"
						if [[ $(basename $files2) == $(basename $var2) ]] && [ -x $files2 ]
						then
							echo "Deleting file if it's executable and has same name"
							$(rm $files2)	
						fi
						$(touch $folder_file/$var2)
					done

				done
			fi
		done
	fi
	done
	$(touch $path1/$var)

done