#!bin/bash

# ZADANIE 

# Dane są dwa katalogi D1 i D2 (dwa argumenty skryptu). Jeśli D1 i D2 odwołują się do tego samego katalogu, to skrypt powinien się zakończyć. 
# W przeciwnym razie należy z D1 usunąć wszystkie dowiązania symboliczne zdefiniowane ścieżką względną, następnie stworzyć w D2 linki 
# do wszystkich plików zwykłych w D1.

# Zadanie dodatkowe (sprawdzam tylko po poprawnym zrobieniu zadania podstawowego):
# Dany jest katalog D oraz ścieżka (niekoniecznie wskazująca na istniejący plik) P (dwa argumenty skryptu). Należy w D stworzyć 
# dowiązanie symboliczne do P zdefiniowane ścieżką względną. Stworzenie ścieżki względnej inaczej niż „ręcznie” jest nisko punktowane.

 path1=$1
 path2=$2



if [ $path1 == $path2 ]
then
    echo "You can't invoke to same directory!"
    exit 1
fi

for file in $path1/*
do
    if [ -L $file ] # is it symlink
    then

        if [[ "$(readlink -n $file)" == *Users* ]] # is it absolute or relative path of symlink
        then
            echo "absolute path"
        else
            echo "relative path"
           # $(rm $file) # delete symlink with relative path
        fi

    fi
done

$(ln -s $path2 $path1)

for file in $path1/*
do
    if [ ! -L $file ] && [ -f $file ] 
    then
        filename=$(basename $file)
        echo "$filename"
        #$(cp $path1/"$filename" $path2/"$filename") 
        $(ln -s /dir1/"$filename" ../dir2/"$filename")
    fi
done
