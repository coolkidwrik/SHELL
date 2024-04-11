#!/bin/zsh

# use the in built say command to convert text to speech
# -v flag is used to specify the voice
# -r flag is used to specify the rate of speech

# read "text?Enter the text you want to convert to speech: "
echo "welcome to the text to speech converter"
echo "choose one of the following options"
echo "f - read from file"
echo "t - read from console"
read "option1?Enter your choice: "

if [ $option1 = "f" ]
then
    text=$(cat text.txt)
else
    echo "Enter the text"
    read "text?Enter the text: "
fi

echo "Choose the language"
echo "e - English"
echo "h - हिंदी"
echo "f - Français"
echo "s - Español"
echo "j - 日本語"
read "option2?Enter your choice: "

# declare an associative array with -A to store the voices
# -a flag is used to specify an indexed array
declare -A voices
voices=( ["e"]="Alex" ["h"]="Lekha" ["f"]="Thomas" ["s"]="Monica" ["j"]="Kyoko" )

# use the say command to convert text to speech
echo $text | say -v "$voices[$option2]" -r 200