#!/bin/bash

#This is a short bash script that will take a given directory and 
#alias the names of all the directories within it to 'cd' so you
#can just type the name of a directory and it will go straight there.
#be carefull with dir naming.

location=$1	# takes location as a parameter

# iterates through the directories in the given location
for dir in $location/*/ 
do
	dirName="${dir//..}"
	dirName="${dirName%/}"
	dirName="${dirName////}"	#strips . & / to get dir names

	dirLoc=$PWD
	dirLoc="${dirLoc//bash#/}"
	dirLoc="${dirLoc// /\\\\ }"	#escapes spaces by adding in \ 
	
	#echo $dirName 			#debug lines to check right values are usd
	echo $dirLoc

	#inserts at line 85 to the ~/.bashrc script might change to append
	#as not everyone will have their aliases on that line
	sed -i "85i\alias $dirName= \'cd $dirLoc\'" ./bashtest
done

echo "Please log out and back in for changes to take effect"
