#!/bin/bash

# Set default values
recipients=""
due_date=$(date +'%A %d-%m-%Y')
motivational_closing="Your cooperation in this matter is much appreciated."
sender=$(whoami)
recipient_option_provided=false


#
#
# loop on the provided args
#
#
while getopts ":r:d:m:s:" opt; do
  case $opt in
    
    ## Handle the case r "recipients"
    r) recipients="$OPTARG" ;recipient_option_provided=true ;;
    
    ## Handle the case d "due_date"
    d) due_date="$OPTARG" ;;
    
    ## Handle the case m "motivational_closing"
    m) motivational_closing="$OPTARG" ;;
    
    ## Handle the case s "sender"
    s) sender="$OPTARG" ;;
    
    ## Handle the case when an invalid option is provided
    \?) echo "Invalid option: -$OPTARG" >&2
        exit 1 ;;
        
    # Handle the case when an option requires an argument but none is provided    
    :) echo "Option -$OPTARG requires an argument."
       exit 1 ;;
  esac
done

#
#
#  Check if -r option is provided
#
#
if ! $recipient_option_provided; then
  echo "Error: The -r option with recipients is required."
  exit 1
fi

# 
# 
# Generate the email message
# 
# 
message="Please submit your TPS reports by $due_date. $motivational_closing\n\nbest regards.\n\n$sender"

#
#
# IFS to a comma, the shell will treat commas as field separators.
#
#
IFS=',' read -ra recipient_list <<< "$recipients"


#
#
# loop on recipient_list 
# Then send a mail to every recipient in the list
#
#
for recipient in "${recipient_list[@]}"; do
    echo -e "Subject: TPS Report Reminder\n$message" | ssmtp -F "Ahmed AbdEllatif" "$recipient"
done