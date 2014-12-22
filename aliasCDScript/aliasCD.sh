#!/bin/bash

#This is a short bash script that will take a given directory and 
#alias the names of all the directories within it to 'cd' so you
#can just type the name of a directory and it will go straight there.
#be carefull with dir naming.

location=$1	# takes location as a parameter

#gets the 9th field(name) from the ls -l of the location passed
dirs=`ls -l $location | egrep '^d' | awk '{print $9}'`


# iterates through the directories in the given location
for dir in $dirs 
do
	dirLoc=$location
	dirLoc="${dirLoc//bash#/}"
	dirLoc="${dirLoc// /\\\\ }"	#escapes spaces by adding in \ 
	dirLoc="${dirLoc//\/\//\/}"             # replaces \\ with \
	dirLoc=$dirLoc$dir
	
#	echo $dirName 			#debug lines to check right values are usd
	echo $dirLoc
	#echo $dirName

	#inserts at line 85 to the ~/.bashrc script might change to append
	#as not everyone will have their aliases on that line
	sed -i "85i\alias $dir=\'cd $dirLoc\'" ~/.bashrc
done

echo "Please log out and back in for changes to take effect"
