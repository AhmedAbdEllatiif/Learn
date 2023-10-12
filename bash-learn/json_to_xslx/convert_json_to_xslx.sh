#!/bin/bash

# Enable the "set -e" option to exit on any command failure
set -e


# default values for options
option_c=false


# check for options
while getopts "c" opt; do
case $opt in
    c)
        option_c=true
    ;;

    *) 
        echo "Option -${opt} does not exist"
        exist 1
    ;;
esac
done


# Shift to remove processed options
shift $((OPTIND-1))


# Check for the required parameters
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_directory> <output_directory>"
    exit 1
fi

# Assign input and output directory paths to variables
input_directory="$1"
output_directory="$2"

#Run the Python script with the provided directories as arguments
python3 jsonConverter.py "$input_directory" "$output_directory" 2> error.txt

# 
# Compress the files is option_c is true
#
if [ "$option_c" = true ]; then
  zip -r archive.zip "${2}"  2>> error.txt
fi