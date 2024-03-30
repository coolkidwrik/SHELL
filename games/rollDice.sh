#!/bin/zsh

# this program simulates rolling a dice
# takes 1 argument - the number of sides on the dice
# generates a random number between 1 and the number of sides
# prints the result

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

    # check if the argument is a number
    if [ $side -lt 2 ]
    then
        echo "Error: Number of sides must be at least 2"
        exit 1
    fi
}


# rolling dice
function rolling {
    for i in {1..10}
    do
        echo -n "*        "
        sleep 0.5
    done
    echo ""
}
 
# rollDice
function rollDice {
  # generate random number between 1 and $side
  result=$((RANDOM % $side + 1))
  echo "You rolled a $result"
}
############################################

# main
errorCheck $side
echo "rolling D$side..."
rolling
rollDice
