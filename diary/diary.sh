#!/bin/zsh

# This script is a simple diary program that allows you to write to a .diary file with
# with some security features. It will ask for a password to read/write to the file, and will
# only allow you to write to the file if the password is correct. It will also encrypt the file
# when you are done writing to it. the file will be decrypted when you want to read it.

# Variables
############################################
file=".diary.txt" # Since the file name starts with a dot, it will be hidden and not be visible in the directory
attempts=0
password=""

# Functions
############################################

# Request the password to read the diary
function request_password() {
    # Check if the password is correct
    # give 3 tries to enter the correct password
    while [ $attempts != 3 ]; do
        # Ask for the password
        echo "Enter the password to read the diary:"
        read -s password

        # attempt to decrypt the file
        ./encription/decript.sh $file $password

        #check if bad password
        if [ $? -ne 0 ]; then
            echo "Incorrect password. You do not have permission to read the diary."
            attempts=$((attempts+1))
        else
            break
        fi
    done

    # If the password is incorrect after 3 tries, exit the program
    if [ $attempts = 3 ]; then
        echo "You have exceeded the number of attempts. Exiting the program."
        exit 1
    fi
}


# !!! This function does not work as expected.
# !!! TODO: Fix this function

# Write to the diary
function write_diary() {
    # open the file in a text editor
    # check when user is done writing
    # encrypt the file
    # close the text editor
    open -a "TextEdit" $file
    
    # the following code is commented out because it does not work as expected
    # sleep 1
    # # wait for the file to be closed on the text editor before encrypting
    # while [ -n "$(lsof -Fp $file | grep -v "^$$$")" ]; do
    #     # lsof -Fp lists all processes that have the file open
    #     # grep -v "^$$$" filters out the current process. This ensures that the script waits until TextEdit closes the file without being misled by its own process
    #     sleep 1
    # done


    # Another failed attempt :(

    # Wait for TextEdit to be closed or the file to be closed in TextEdit
    # while true; do
    #     # Check if TextEdit is running
    #     # osascript is a command line tool for executing AppleScript
    #     # >/dev/null redirects stdout to null. 2>&1 redirects stderr (file descripter 2) to stdout (file descripter 1)
    #     osascript -e 'tell application "System Events" to (name of processes) contains "TextEdit"' >/dev/null 2>&1
    #     # $? is the exit status of the last command
    #     textedit_running=$?
    #     if [ $textedit_running -eq 0 ]; then
    #         sleep 1
    #     else
    #         break
    #     fi
    # done

    # Wait for TextEdit to be closed or the file to be closed in TextEdit.
    while fuser "$file". 2>&1 | grep -q -v "diary.sh"; do
        sleep 1
    done

    # Encrypt the file
    ./encription/encript.sh $file $password

    # Notify the user that the diary has been written
    echo "Diary is now closed. Goodbye!"
}

# Main
############################################

# Request the password to read the diary
request_password

# Write to the diary
write_diary