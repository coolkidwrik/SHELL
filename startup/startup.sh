#!/bin/zsh

# get colors
############################################
source ./color.sh

# welcome message
############################################
echo "${UCyan}Welcome back $(whoami)${Color_Off}"

# get the weather
############################################
echo 
echo "${IYellow}Here is the weather report for today${IRed}"
./getWeather.sh

# change color off
echo "${Color_Off}"