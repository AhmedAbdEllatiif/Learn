#!/bin/bash

# Enable the "set -e" option to exit on any command failure
set -e


# default values for options
option_c=false

# current date
formatted_date=$(date "+%Y-%m-%d:%H:%M:%S")


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


<<comment
    -This function is resposible for compressing 
    -The Function checks if option_c if true to compress the output
comment
function compress_if_required()
{   
    if [ "$option_c" == true ];then
    
        # make a new file with the same name but with zip extension
        local converted_ext
        converted_ext=$(change_ext "$1" "zip")

        # compress the 1st param ($1) 
        # and save it with the new name $1.zip (converted_ext)
        zip -r "$converted_ext" "$1"

        if [  $? == 0 ]; then
            return 0  # Return success (0) status
        else
            return 1  # Return failure (non-zero) status
        fi
    fi 
}

<<comment
    -This function change the 1st parameter extension
    -takes to args 
        +1st: file_path 
        +2nd: the new extension
comment
function change_ext()
{
    input=$1
    ext=$2
    base_name=$(basename "$input")
    name_no_ext="${base_name%.*}"
    converted_name="${name_no_ext}.${ext}" 
    echo  "${converted_name}"
}


# Assign input and output directory paths to variables
input_path="$1"


#  Exit the script if no args passed 
if [ ! -d "$input_path" ] && [ ! -f "$input_path" ]; then
    echo -e "\nUsage: of $0 either with \n >>> $0 -d <input_directory> \n or \n >>> $0 -f <file_name>\n"
    exist 1
fi



<<comment
    Handle if a directory passed as an argument
comment
if [ -d "$input_path" ]; then
    # directory name with the current date
    converted_dir_path="converted_at_(${formatted_date})"

    # make directory named with the date
    mkdir "$converted_dir_path"

    # run python script
    python3 "$(dirname "${0}")/files_in_directory_to_xslx.py" "$input_path" "$converted_dir_path"

    # compress if required
    compress_if_required  "$converted_dir_path"
fi



<<comment
    Handle if a file passed as an argument
comment
if [ -f "$input_path" ];then
    # convert the extension name form .json to xlsx
    converted_name=$(change_ext "$input_path" "xlsx")
    name_with_date="(${formatted_date})_${converted_name}"

    # run the python script to convert json to excel 
    # 1st arg is the the input file (the json file to be converted)
    # 2nd arg is the path of the execl file to be written from the json
    python3 "$(dirname "${0}")/file_to_xslx.py"  "$input_path"  "$name_with_date"

    # compress the file after is moved to the current directory
    compress_if_required "$name_with_date"
fi









# 
# Compress the files is option_c is true
#
# if [ "$option_c" = true ]; then
#   zip -r  "archive_at_(${formatted_date}).zip"  "${converted_dir_path}"   2>> error.txt
# fi