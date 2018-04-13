#!/bin/bash
###############################################################################
# Script to convert songs downloaded from youtube-dl into mp3's               #
# Written by								      #
# Andrew Blankfield                                                           #
###############################################################################

mp3ify() {

ffmpeg -i $1 -acodec mp3 -ac 2 -ab 192k ${1%.*}.mp3

}

echo "m4a to mp3 converter by andipanic"

echo "replacing spaces with underscores..."
ls *.m4a | while read song; do mv "$song" $(echo "$song" | tr " " "_"); done

for song in $(ls *.m4a);
do
	echo "converting m4a to mp3..."
	mp3ify "$song"
done

if [ ! -d ./m4a]; then
	echo "m4a directory does not exist... creating it"
	mkdir ./m4a
fi

echo "moving .m4a files to m4a directory..."
mv *.m4a ./m4a

echo "conversion is now complete.  enjoy! "
