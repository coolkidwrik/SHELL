#!/bin/zsh

# this program simulates rolling a dice
# takes 1 argument - the number of sides on the dice
# generates a random number between 1 and the number of sides
# prints the result
# stores the result in a file

# get first argument
side=$1

# helper function
############################################
# error check
function errorCheck {
    # check if the number of arguments is correct
    if [ $# -ne 1 ]
    then
        echo "Usage: rollDice.sh <number of sides>"
        exit 1
    fi

    # check if the argument is greater than 1
    if [ $side -lt 2 ]
    then
        echo "Error: Number of sides must be at least 2"
        exit 1
    fi
}


# rolling dice
function rolling {
    for i in {1..8}
    do
        echo -n "*        "
        sleep 0.5
    done
    echo ""
}
 
# rollDice
# note for self: > overwrites the file, >> appends to the file           
function rollDice {
    # generate random number between 1 and $side and writes it to a file
    result=$((RANDOM % $side + 1))
    echo "You rolled a $result"
    echo "$result" > rollResult.txt
}
############################################

# main
errorCheck $side
echo "rolling D$side..."
rolling
rollDice
