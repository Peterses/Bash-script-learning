#!/bin/bash

# Napisz skrypt, który z zadanego miejsca systemu plików (parametr wywołania skryptu), 
# uwzględniając wszystkie możliwe podkatalogi, wypisze ścieżki do N (opcjonalny parametr 
# wywołania skryptu; domyślnie 10) największych (pod względem rozmiaru w bajtach) plików. 
# Jeśli kilka plików ma taki sam rozmiar, wybieramy dowolny z nich (bez znaczenia który).

path1=$1


find $path1 -type f -printf "%s %p\n"| sort -nr | head -n ${2:-10} | cut -d' ' -f2-
