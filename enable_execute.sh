#!/bin/zsh

# get first argument
file=$1

# helper function
############################################
# error check
function errorCheck {
    # check if the number of arguments is correct
    if [ $# -ne 1 ]
    then
        echo "Usage: enable_execute.sh <file>"
        exit 1
    fi
}


# function to check if a file is executable
function quarantine_off {
    # check if quarantine attribute is set
    if [ -n "$(xattr -p com.apple.quarantine $file)" ]; then
        # remove quarantine attribute
        xattr -d com.apple.quarantine $file
        echo "Quarantine attribute removed"
    else
        echo "Quarantine attribute not set"
    fi
}


function set_executable {
    # check if file is executable
    if [ -x $file ]; then
        echo "File is already executable"
    else
        # make file executable
        chmod +x $file
        echo "File is now executable"
    fi
}
############################################

# main
errorCheck $file
# check if file exists
if [ -f $file ]; then
    # check if quarantine attribute is set
    quarantine_off
    # check if file is executable
    set_executable
else
    echo "File does not exist"
fi