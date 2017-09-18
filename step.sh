#!/bin/bash

# exit if a command fails
set -e

LAST_COMMIT_DATE=`git show -s --format=%ci`
envman add --key LAST_COMMIT_DATE --value "$LAST_COMMIT_DATE"
echo " (i) Last commit date: ${LAST_COMMIT_DATE} -> Saved to \$LAST_COMMIT_DATE environment variable."

REGEX_DATE_NUMBERS="[0-9][0-9]([0-9][0-9])-([0-9][0-9])-([0-9][0-9]) ([0-9][0-9]):([0-9][0-9])"
if [[ $LAST_COMMIT_DATE =~ $REGEX_DATE_NUMBERS ]]; then
    LAST_COMMIT_DATE_NUMBERS=${BASH_REMATCH[1]}${BASH_REMATCH[2]}${BASH_REMATCH[3]}${BASH_REMATCH[4]}${BASH_REMATCH[5]}
else
    echo " [!] Could not parse numbers from last commit date!"
    exit 1
fi

envman add --key LAST_COMMIT_DATE_NUMBERS --value "$LAST_COMMIT_DATE_NUMBERS"
echo " (i) Last commit date numbers: ${LAST_COMMIT_DATE_NUMBERS} -> Saved to \$LAST_COMMIT_DATE_NUMBERS environment variable."
