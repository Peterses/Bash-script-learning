#!/bin/bash


# ZADANIE

# Napisz skrypt, który będzie pełnił funkcję programu czyszczącego katalog użytkownika ze śmieci:
# a) program powinien zliczyć wszystkie puste pliki i katalogi w zadanym miejscu (parametr wywołania skryptu), należące do danego użytkownika (parametr wywołania skryptu)
# b) program powinien zgłosić pliki i katalogi, których zawartość nie była zmieniana od roku
# c) program powinien zaraportować wszystkie pliki, których zadany użytkownik nie jest oficjalnym właścicielem (nie uwzględniamy grupy użytkownika)
# d) program powinien zgłosić wszystkie pliki, których wskazany użytkownik nie może przeczytać


path1=$1

currentUser=$(whoami)

echo "A)"
find $path1 -empty -user $currentUser

echo "B)"
find $path1 -mtime +365 -printf "%p  Not changed for at least 1 year\n"


echo "C)"
find $path1 -not -user $currentUser -printf "%p  you are not owner of this file\n"

echo "D)"
find $path1 -user $currentUser -not -readable -type f -printf "%p not allowed to read"
