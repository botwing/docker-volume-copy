#!/bin/bash

############################################################
# Functions declararions                                   #
############################################################
function help
{
    # Display Help
    echo "The script copies data from SOURCE to DESTINATION docker volume"
    echo "SOURCE and DESTINATION are docker volume names"
    echo
    echo "Syntax: docker-volume-copy SOURCE DESTINATION"
    echo
    echo "options:"
    echo "h    Prints this Help"
    echo "V    Print software version and exit"
    echo
}

function volumeExists
{
    local isOldExists=$(docker volume inspect "$1" 2>/dev/null | grep '"Name":')
    local isOldExists=${isOldExists#*'"Name": "'}
    local isOldExists=${isOldExists%'",'}
    local isOldExists=${isOldExists##*( )}

    if [[ "$isOldExists" == "$1" ]]; then
        return 1
    else
        return 0
    fi
}

############################################################
# Process the input options. Add options as needed.        #
############################################################
VERSION="1.0.0"

# Get the options
while getopts ":hV" option; do
    case $option in
        h) # display Help
            help
            exit
            ;;
        V) # print version and exit
            echo $VERSION
            exit
            ;;
    esac
done

############################################################
# Check input variables.                                   #
############################################################

if (( $# < 2 )); then
    echo
    echo "Command requires SOURCE and DESTINATION"
    echo
    help
    exit 1
fi

SOURCE_VOLUME="$1"
DESTINATION_VOLUME="$2"

############################################################
# Main Process                                             #
############################################################

echo "Copying data from '$SOURCE_VOLUME' to '$DESTINATION_VOLUME'"

echo "Checking volume ..."
# check if old volume exists
volumeExists ${SOURCE_VOLUME}
if [[ "$?" -eq 0 ]]; then
    echo "Volume $SOURCE_VOLUME doesn't exist"
    exit 2
fi

echo "Preparing container ..."

docker run --rm -v ${SOURCE_VOLUME}:/from -v ${DESTINATION_VOLUME}:/to botwing/copy-volume

if [[ "$?" -eq 0 ]]; then
    echo "Successfuly copied"
else
    echo "Volume copy error"
    exit 3
fi
