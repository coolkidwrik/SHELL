#!/bin/zsh

# This script is a file encryption program that will encrypt a file with a password

# This script will decrypt a file with a password
# It will ask for a password to encrypt the file with
# It will then decrypt the file with the password

# you will need the password to decrypt the file
# if you enter the wrong password, the file will not be decrypted

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
        echo $#
        echo "Usage: decript.sh <file> <password>"
        exit 1
    elif [ ! -f $file.enc ]
    then
        # check if the file to decript exists
        echo "Error: file not found"
        exit 1
    fi
}

# decrypt the file
function decrypt_file() {
    # Decrypt the file with the password
    # openssl works by taking the file and decrypting it with the aes-256-cbc encryption algorithm
    # The -d flag specifies that we are decrypting the file
    # The -in flag specifies the input file
    # The -out flag specifies the output file
    # The -k flag specifies the password
    # The -pbkdf2 flag specifies the password-based key derivation function 2, which is a key derivation function that is used to derive a key from a password

    # 2>/dev/null suppresses the error message if the password is incorrect by redirecting stderr(fd 2) to /dev/null
    openssl enc -d -aes-256-cbc -in $file.enc -out $file -k $password -pbkdf2 2>/dev/null

    # check if bad password
    if [ $? -ne 0 ]; then
        # echo "Incorrect password. File not decrypted."
        rm $file
        exit 1
    fi

    # Remove the encrypted file
    rm $file.enc
}

# Main
############################################
errorCheck $file $password

decrypt_file