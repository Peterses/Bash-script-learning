#!/bin/bash

# Pobierz plik http://datko.pl/SO2/tox.ini - najlepiej użyj programu wget z poziomu
# konsoli (składnia: wget <adres-pliku>). Następnie napisz skrypt, który z całej
# zawartości tego pliku zwróci (wypisze na ekran) wszystkie adresy URL (tylko i wyłącznie
# adresy; każdy znaleziony adres wypisać w nowej linii). [poproszę o jedno, zmyślne
# wykonanie komendy awk z wyrażeniami regularnymi]


wget -qO- http://datko.pl/SO2/tox.ini | awk 'match($0, /(http|https):\/\/\S+/) {
    
    if(substr($0, RSTART+RLENGTH-1, 1)=="}" || substr($0, RSTART+RLENGTH-1, 1)==".") {
        print substr($0, RSTART, RLENGTH-1)
    } else {
        print substr($0, RSTART, RLENGTH)
    }
}'
