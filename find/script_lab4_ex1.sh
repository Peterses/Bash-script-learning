#!/bin/bash

# ZADANIE 1 - Napisz skrypt, który dla podanego miejsca w systemie plików (parametr wykonania skryptu) oraz wszystkich jego podkatalogów, wypisze ścieżkę, nazwę użytkownika, grupy i uprawnienia do plików zwykłych, których formalnym właścicielem nie jest aktualny użytkownik (whoami).


path1=$1

currentUser=$(whoami)

echo $currentUser

files=$(find $path1 -type f -user $currentUser )

printf "PATH || USER || GROUP || ACCESS \n"
stat --printf="%n || %u || %G || %A \n" $files

# SECOND WAY TO PRINT

find $path1 -type f -user $currentUser -printf "PATH: %p ||| USER: %u ||| GROUP: %g ||| ACCESS: %M \n"

