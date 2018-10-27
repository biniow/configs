#!/bin/bash

NAME=DOM
echo "Usuwanie blednych wpisow..."
brsaneconfig4 -r ${NAME}


SCANNER_NAME=brw1008b19c2863.local
IP_REGEX="\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

echo "Skanowanie sieci lokalnej w poszukiwaniu skanera..."
IP_ADDR=$(nmap "${SCANNER_NAME}" | grep -oP "${IP_REGEX}")

echo "============================"
echo "Adres IP skanera: ${IP_ADDR}"
echo "============================"

if [[ -z "${IP_ADDR}" ]] ; then
	echo "Niepoprawny adres IP. Sprawdz czy urzadzenie jest poprawnie podlaczone do sieci"
	exit 1
fi

MODEL=DCP-J105
brsaneconfig4 -a name=${NAME} model=${MODEL} ip=${IP_ADDR}

if [[ $? -ne 0 ]] ; then
	echo "Ponowne podlaczenie nie udalo sie. Poczekaj na przyjazd Wojtka :)"
	exit 1
fi

echo "Podlaczono prawidlo. Sprobuj zeskanowac :-)"
echo "Nacisnij ENTER zeby wyjsc z programu"
read
