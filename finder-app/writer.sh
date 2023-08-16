#/bin/bash
# Patrick DuRussel II
# 2023-08-13

# 10) Write a shell script finder-app/writer.sh as described below
# 
# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr
# 
# Exits with value 1 error and print statements if any of the arguments above were not specified
# 
# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.
# 
# Example:
# 
#        writer.sh /tmp/aesd/assignment1/sample.txt ios
# 
# Creates file:
# 
#     /tmp/aesd/assignment1/sample.txt
# 
#             With content:
# 
#             ios
echo $#

if [ $# -ne 2 ] ; then
	echo "We need more arguments!"
	exit 1
fi

full_path=$1

echo $1

base=$(basename $1)
direct=$(dirname $1)
echo "base"
echo $base
echo "directory"
echo $direct
echo $2
### First Idea was to iterate over the path to see if it was made
### Then I realized i could just use mkdir with -p
#path_depth=$(echo $1 | tr -dc // | wc -c)

#pwd | cut -d'/' -f-7
echo "cd ing into the directory"
cd $direct
worked=$?
echo "Worked? $worked"
if [ $worked -ge 1 ]
then
	mkdir -p $direct
	cd $direct
	pwd
	touch $base
	echo $2 >> $base
else
	echo "The directory exsist!!"
	pwd
	touch $base
	echo $2 >> $base
fi

	
#probably should use mkdir -p, the -p makes the parent directories as needed.
#should also use, dirname and basename.
exit 0

