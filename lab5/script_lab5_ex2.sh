#!/bin/bash
#
# Zabawy z komendą lsof (uwaga: wynik komendy może być nieprzyzwoicie długi). Niech skrypt:
# a) policzy, ile jest wszystkich otwartych plików przez wszystkie uruchomione procesy w systemie
# b) wyświetli kilka (opcjonalny parametr uruchomienia skryptu, domyślnie 10) plików zwyczajnych (wartość REG w polu TYPE), które mają największy rozmiar
# c) zamieni wielokrotne wystąpienia spacji na pojedyncze ich wystąpienia
# d) wyświetli listę, zawierającą numery procesów (pole PID) oraz liczbę otwartych przez nie plików zwykłych (policzyć), posortowaną w kolejności malejącej

lsof | wc -l

lsof | egrep 'REG' | awk '{ print $7,$9 }' | sort -n -r -k1 | head -n ${1:-10}

lsof | tr -s " "

lsof | egrep 'REG' | awk '{print $1,$2}' | sort | uniq -c | sort -n -r -k1
