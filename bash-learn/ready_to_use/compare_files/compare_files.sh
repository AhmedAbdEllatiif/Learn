#!/bin/bash


#
# check if the command have two commands 
#
if [ -z "$1" -o -z "$2" ]
then 
    echo "use $0 <file1> <file2>"
    exit 0
fi

#
# check if the first file is file not directory
#
if ! [ -f "$1" ]
then 
    echo "$1 is not a file"
    exit 1
fi

#
# check if the second file is file not directory
#
if ! [ -f "$2" ]
then
    echo "$2 is not a file"
    exit 1
fi


#
# compare if the files are the same 
#
if cmp -s "$1" "$2";
then
    echo "Files are the same"
else    
    echo "Files are not the same"
    exit 1
fi