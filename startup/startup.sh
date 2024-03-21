#!/bin/zsh

# get colors
############################################
# This file path may have to change on your machine
# could be from root, home, or relative to your .zshrc file
source ./color.sh

# welcome message
############################################
echo "${UCyan}Welcome back $(whoami)${Color_Off}"

# get the weather
############################################
echo 
echo "${IYellow}Here is the weather report for today${IRed}"
# This file path may have to change on your machine
# could be from root, home, or relative to your .zshrc file
./getWeather.sh

# change color off
echo "${Color_Off}"
