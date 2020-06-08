#!/bin/bash

# Napisz skrypt, który wyznaczy całkowitą dostępną (sumę, przynajmniej teoretycznie)
# powierzchnię dyskową w lokalnej maszynie, analizując wynik działania komendy lsblk -–bytes.
# Odpowiednie dane znajdują się w czwartej kolumnie wyniku (SIZE). Jako rezultat proszę podać,
# ile to będzie w Bajtach, Megabajtach, itd. [poproszę o jedno, zmyślne wykonanie komendy awk]


lsblk --bytes | awk 'BEGIN{sum=0}
{sum+=$4;}
END {print sum " B"; print sum=sum/1024 " KB"; print sum=sum/1024 " MB"; print sum=sum/1024 " GB"}'
