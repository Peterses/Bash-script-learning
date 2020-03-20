#!bin/bash


# zadanie 23. Napisz skrypt, który sprawdzi zawartość katalogu (parametr wywołania skryptu) i usunie z niego wszystkie wiszące dowiązania miękkie (wskazujące na nieistniejące elementy). 


path1=$1


for file in $path1/*
do
    if [ -L $file ] # is it symlink
    then
        echo "$file - dowiazanie miekkie"

        path_to_sym=$(readlink $file)

        if [ -f $path_to_sym ]
        then
            echo "ok"
        else
            $(rm $file)
        fi
    fi
done