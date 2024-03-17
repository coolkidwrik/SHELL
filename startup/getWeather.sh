#!/bin/zsh

# helper function
############################################
function get_weather {
    # by not providing a location, the API will use the user's IP address to get the weather
    echo 
    echo
    # -s flag is used to suppress the progress bar
    weather=$(curl -s "wttr.in/?1")
    echo "$weather"
}

function check_connection {
    # check if the user is connected to the internet
    if ping -q -c 1 -W 1 wttr.in >/dev/null; then
        get_weather
    else
        echo "Failed to get Report."
        echo "Check your internet connection."
    fi
}
############################################

# main program
check_connection