#!/bin/bash
# Patrick DuRussel II
# 2023-07-13

# 9) Write a shell script finder-app/finder.sh as described below:
# 
# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr
# 
# Exits with return value 1 error and print statements if any of the parameters above were not specified
# 
# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
# 
# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).
# 
# Example invocation:
# 
#        finder.sh /tmp/aesd/assignment1 linux

set -x

if [ "$#" != 2 ];
then
	echo "Please use this as follows, ./finder.sh directory match"
	exit 1
fi

echo $1
cd $1
if [ $? -eq 1 ];
then
	echo "Please enter the full directory."
	exit 1
fi

y=$(find $1 -type f | wc -l)

x=$(grep -rni "$2" | wc -l)
#find $1 -name "*$2*" -print | wc -l)

echo "The number of files are $y and the number of matching lines are $x"

#echo "Total files are $y and total matched lines are $x"

exit 0
