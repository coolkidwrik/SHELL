#!/bin/zsh

# Description:
#-----------------------
# This script will handle a todo list from the user
# It will allow the user to add, remove, and list items
# The list will be stored in a file called todo.txt

# Handling the list:
#-----------------------
# The file will be created if it does not exist
# The file will be read into an array
# The array will be used to:
# - display the list
# - add items
# - remove items

# The array will be written back to the file

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
            echo "$i. ${todo_list[$i]}"
        done
    fi
}

# Function to add an item to the list
function add_item {
    read "item?Enter the item: "
    todo_list+=($item)
}

# Function to remove an item from the list
function remove_item {
    read "item?Enter the item number: "
    if [ $item -gt 0 ] && [ $item -le ${#todo_list[@]} ]
    then
        unset todo_list[$item]
    else
        echo "Invalid item number"
    fi
}

function display_menu {
    echo "Welcome to the todo list manager"
    echo "Choose one of the following options"
    echo "1. Display the list"
    echo "2. Add an item"
    echo "3. Remove an item"
    echo "4. Exit"
    read "option?Enter your choice: "
}

function handle_options {
    case $option in
        1)
            display_list
            ;;
        2)
            add_item
            ;;
        3)
            remove_item
            ;;
        4)
            # Write the array back to the file
            echo ${todo_list[@]} > todo.txt
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac

}

# Main Script:
############################################
Check if the file exists
if [ -f todo.txt ]
then
    # Read the file into the array
    todo_list=($(cat todo.txt))
else
    # Create the file
    touch todo.txt
fi

while true 
do
    display_menu
    handle_options
    if [ $option -eq 4 ]
    then
        break
    fi
done

