#!/bin/zsh

# Description:
#-----------------------
# list out the local todo list

# Variables:
############################################
declare -a todo_list

# Helper Functions:
############################################
# Function to display the list
function display_list {
    if [ ${#todo_list[@]} -eq 0 ]
    then
        echo "The list is empty"
    else
        for i in ${#todo_list[@]}
        do
            echo "$i. ${todo_list[$i]}\n"
        done
    fi
}

# Main:
############################################
# load the list
if [-f todo.txt]
then
    todo_list=($(cat todo.txt))
else
    echo "no todo list found" 
    exit 1
fi

display_list

