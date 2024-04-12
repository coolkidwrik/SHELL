#!/bin/zsh

# Description:
#-----------------------
# list out the local todo list
# this removes the user input and interaction
# the goal is to simply display the list

# import colors
source ./color.sh

# Variables:
############################################
declare -a todo_list
todo_file=todo.txt

# Helper Functions:
############################################
# Function to display the list
function display_list {
    echo "${UGreen}To Do List${IPurple}"
    if [ ${#todo_list[@]} -eq 0 ]
    then
        echo "${BIYellow}Nothing to do!${Color_Off} 🥳"
        echo "\n"
    else
        for i in {1..${#todo_list[@]}}
        do
            echo "$i. ${todo_list[$i]}"
        done
        echo "${Color_Off}\n"
    fi
}

# Main:
############################################
# Check if the file exists
if [ -f $todo_file ]
then
    # Read the file into the array
    while IFS= read -r line; do
        todo_list+=("$line")
    done < $todo_file
else
    # Create the file
    touch $todo_file
fi

display_list

