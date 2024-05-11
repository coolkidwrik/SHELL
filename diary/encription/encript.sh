#!/bin/zsh

# This script is a file encryption program that will encrypt a file with a password

# This script will encrypt a file with a password
# It will ask for a password to encrypt the file with
# It will then encrypt the file with the password

# Variables
############################################
file=$1
password=$2

# Functions
############################################
# error check
function errorCheck {
    # check if the number of arguments is correct
    # if the number of arguments is greater than 2, print an error message and exit
    # if number of arguments is 0, print an error message and exit
    # possible to have no password, but not possible to have no file
    if [ $# -gt 2 ] || [ $# -eq 0 ]
    then
        echo "Usage: encript.sh <file> <password>"
        exit 1
    elif [ ! -f $file ]
    then
        # check if the file to encript exists
        echo "Error: file not found"
        exit 1
    fi
}

# encrypt the file
function encrypt_file() {
    # Encrypt the file with the password
    # openssl works by taking the file and encrypting it with the aes-256-cbc encryption algorithm
    # The -salt flag adds a salt to the encryption
    # The -in flag specifies the input file
    # The -out flag specifies the output file
    # The -k flag specifies the password
    # The -pbkdf2 flag specifies the password-based key derivation function 2, which is a key derivation function that is used to derive a key from a password

    # 2>/dev/null suppresses the error message if the password is incorrect by redirecting stderr(fd 2) to /dev/null
    openssl enc -aes-256-cbc -salt -in $file -out $file.enc -k $password -pbkdf2 2>/dev/null

    # Remove the original file
    rm $file
}

# Main
############################################
errorCheck $file $password

encrypt_file