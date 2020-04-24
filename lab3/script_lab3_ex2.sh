#!/bin/bash


# Napisz skrypt, który dla wszystkich plików wykonywalnych z jakiegoś katalogu (parametr wywołania skryptu) utworzy dowiązania twarde w drugim katalogu (parametr wywołania skryptu), 
# zaś dla podkatalogów utworzy on dowiązania miękkie. Dodatkowo:
# a) skontroluj liczbę argumentów i uprawnienia do odpowiednich elementów systemu plików,
# b) nie twórz nowego dowiązania, jeżeli w drugim katalogu istnieje już dowiązanie twarde (wcześniej zakładaliśmy, że na pewno nie istnieje)
# c) zadbaj o to, żeby dowiązania symboliczne byłī stworzone względem katalogu roboczego (pwd)
# d) w przypadku podkatalogów pierwszego danego katalogu, utwórz odpowiednie odwiązania do plików z tych podkatalogów w drugim danym katalogu (załóż, że nazwy plików są unikalne)

path1=${1:-/Users/peterses/Desktop/D}
path2=${2:-/Users/peterses/Desktop/K}

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

if [ ! -d "$path2" ] || [ ! -w "$path2" ]
then
    echo "$path2 not exist or you dont have privileges"
    exit 1
fi

for file in $path1/*
do
    if [ -x $file ]
    then

            if [ $file -ef $path2/$(basename $file2) ]
            then
               echo "$file is hard link" 
            else
                filename=$(basename $file)
                ln $file $path2/"$filename"  
            fi

    fi

    if [ -d $file ] 
    then 
        filename2=$(basename $file)

        ln -s $(realpath --relative-to=dir2 $file) dir2

        for file3 in $path1/"$filename2"/*
        do 
            ln -s $file3 $path2
        done
    fi
done