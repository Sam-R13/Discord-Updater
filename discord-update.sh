#!/bin/bash
# Discord Update Script
# Copyright Sam Rabe 2024
# samueljrabe@gmail.com
# This is a basic script designed to automatically check for and install discord updates on Debian
# I plan to update this in the future to run automatically when the computer starts, and possibly with more functionality


path='/home/sam/Downloads/'
placeholderFile='placeholder.deb'
finalFile='discord.deb'
URL='https://discord.com/api/download?platform=linux&format=deb'

wget -O $path$placeholderFile -q $URL

if diff $path$placeholderFile $path$finalFile;
then
	rm $path$placeholderFile
else
	mv $path$placeholderFile $path$finalFile
	dpkg -i $path$finalFile
fi
