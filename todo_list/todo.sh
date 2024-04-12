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

# import colors
source ./color.sh

# Variables:
############################################
declare -a todo_list
todo_file=todo.txt

# Helper Functions:
############################################
# restore the list from the file
function restore_list {
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
}


# Function to display the list
function display_list {
    if [ ${#todo_list[@]} -eq 0 ]
    then
        echo "${Green}The list is empty"
        echo "\n"
    else
        echo "${UGreen}To Do List${Green}"
        for i in {1..${#todo_list[@]}}
        do
            echo "$i. ${todo_list[$i]}"
        done
        echo "\n"
    fi
    echo "${Color_Off}"
    read "?Press enter to continue"
}

# Function to add an item to the list
function add_item {
    read "item_add?Enter the item: "
    todo_list+=($item_add)
}

# Function to remove an item from the list
function remove_item {
    read "item_num?Enter the item number: "
    # get the index of the item
    index=$(($item_num - 1))
    if [ $index -ge 0 ] && [ $index -lt ${#todo_list[@]} ]
    then
        # this does not work as expected
        # unset todo_list[$index] # this will remove the item from the array but will not reindex the array
        # todo_list=("${todo_list[@]}") # this will reindex the array

        # Remove the item using array slicing
        todo_list=("${todo_list[@]:0:$index}" "${todo_list[@]:$(($index + 1))}")
    else
        echo "Invalid item number"
    fi
}

function display_menu {
    echo "Choose one of the following options ${IYellow}"
    echo "1. Display the list"
    echo "2. Add an item"
    echo "3. Remove an item"
    echo "4. Exit ${Color_Off}"
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
            # truncate the file
            # The colon symbol (:) is typically used as a placeholder or null command in shell scripting and produces no output.
            : > $todo_file

            # Write the array back to the file
            for item in "${todo_list[@]}"
            do
                echo "$item" >> $todo_file # append item to the file (this apparently adds a newline character to the end of the item)
            done
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac

}

# Main Script:
############################################
# Check if the file exists
restore_list

echo "Welcome to the todo list manager"
while true 
do
    display_menu
    handle_options
    if [ $option -eq 4 ]
    then
        break
    fi
done