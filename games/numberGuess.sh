#!/bin/zsh

# a game that asks the user to guess a number

# the user is prompted to guess a number between 1 and 100
# the user is given 5 chances to guess the number
# if the user guesses the number correctly, they are congratulated
# if the user fails to guess the number, they are told the number
# get users name

############################################
# helper function
############################################
function intro {
    user=$(whoami)
    echo "Hello $user, welcome to the number guessing game"
    sleep 0.5
    echo "what would you like to be called?"
    read name
    echo "Alright $name, let's play a game"
    echo "do you want to play a game? (y/n)?"
    read response
}


function give_hint {
    # number to guess
    n=$1
    # the user's guess
    g=$2

    if [ "$g" -gt "$n" ]
    then
        echo "The number is less than $guess"
    else
        echo "The number is greater than $guess"
    fi
}

############################################
# local variables
correct=0
total=0
ATEMPTS=5

# call introducton to the game
intro

if [ $response = "n" ]
then
    echo "Goodbye 😢"
    exit   
fi

echo "Great! Let's play 😎"
echo
sleep 1
while [ $response = "y" ]
do
    # generate the random number
    num=$(($RANDOM % 100))
    # increment the total number of games played
    (( total++ ))
    # game here
    echo "I'm thinking of a number between 1 and 100"
    echo "you will have $ATEMPTS attempts to guess the number"
    sleep 0.5
    echo "Good luck!"
    sleep 0.5
    echo
    for i in {1..$ATEMPTS}
    do
        echo "Guess the number: "
        read guess
        if [ $guess -eq $num ]
        then
            echo "Congratulations! You guessed the number correctly"
            (( correct++ ))
            break
        else
            echo "Sorry, that's not the number"
            give_hint $num $guess
        fi
    done
    echo "The number was $num"
    sleep 1
    echo "Do you want to play again? (y/n)?"
    read response
    if [ $response = "n" ]
    then
        break
    fi
    echo
done
echo "Your score is $correct / $total"
echo "Goodbye $name, thanks for playing 😊"
echo


