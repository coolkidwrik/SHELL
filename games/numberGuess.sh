#!/bin/zsh

# a game that asks the user to guess a number

# the user is prompted to guess a number between 1 and 100
# the user is given 5 chances to guess the number
# if the user guesses the number correctly, they are congratulated
# if the user fails to guess the number, they are told the number
# get users name

# import colors
source ./color.sh

############################################
# helper function
############################################
function intro {
    user=$(whoami)
    echo "Hello $user, welcome to ${BIYellow}the number guessing game${Color_Off}"
    sleep 0.5
    echo "what would you like to be called?${On_IPurple}"
    read name
    echo "${Color_Off}"
    echo "Alright ${UPurple}$name${Color_Off}, let's play a game"
    echo "do you want to play a game? (y/n)?"
    read response
}

function choose_difficulty {
    echo "Choose a difficulty level${Blue}"
    echo "1. Easy"
    echo "2. Medium"
    echo "3. Hard"
    read level
    case $level in
        1)
            echo "${Color_Off}You have chosen ${Blue}easy${Color_Off}\n"
            difficulty=10
            ;;
        nice | 69)
            echo "${Color_Off}You have chosen ${Purple}'NICE'${Color_Off}\n"
            difficulty=69
            ;;
        2)
            echo "${Color_Off}You have chosen ${Blue}medium${Color_Off}\n"
            difficulty=100
            ;;
        3)
            echo "${Color_Off}You have chosen ${Blue}hard${Color_Off}\n"
            difficulty=1000
            ;;
        "ez money")
            # bonus level 2
            echo "${Color_Off}You have chosen ${Red}impossible${Color_Off}\n"
            echo "since u think it's ez money, I'll make it impossible for you\n"
            echo "Good luck 😂"
            difficulty=1729 # Ramanujan's number
            ;;
        "emotional damage")
            # bonus level 3
            echo "${Color_Off}You have chosen ${BRed}DEATH${Color_Off}\n"
            echo "you are a brave soul\n"
            difficulty=100000
            ;;
        *)
            echo "${Color_Off}Invalid choice\n"
            choose_difficulty # recursive call back
            ;;
    esac
}


function give_hint {
    # number to guess
    n=$1
    # the user's guess
    g=$2

    if [ "$g" -gt "$n" ]
    then
        echo "The number is ${Red}less than $guess${Color_Off}"
    else
        echo "The number is ${Red}greater than $guess${Color_Off}"
    fi
}

############################################
# local variables
readonly ATEMPTS=5
correct=0
total=0

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
    # get difficulty level
    choose_difficulty
    # generate the random number
    num=$(($RANDOM % difficulty+1))
    # increment the total number of games played
    (( total++ ))
    # game here
    echo "I'm thinking of a number between 1 and $difficulty"
    echo "you will have ${URed}$ATEMPTS${Color_Off} attempts to guess the number"
    sleep 0.5
    echo "Good luck!"
    sleep 0.5
    echo
    for i in {1..$ATEMPTS}
    do
        echo "Guess the number: ${UGreen}"
        read guess
        if [ $guess -eq $num ]
        then
            echo "${BGreen}Congratulations!${Color_Off} You guessed the number correctly"
            (( correct++ ))
            break
        else
            echo "${Color_Off} Sorry, that's not the number"
            give_hint $num $guess
        fi
    done
    echo "The number was $num"
    sleep 1
    echo "${Cyan}Do you want to play again?${Color_Off} (y/n)?"
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


