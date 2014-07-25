#!/bin/bash
#
# Script to test most of yn.sh's functionality.
# Copyright (C) 2014 by Will Murray (Willscrlt) - Some Rights Reserved
# Permission to copy and modify is granted under the LGPL v3 or later license.
# Last revised 2005-07-25
#
# Usage: test_yn.sh
#

# Include the function
source yn.sh


# A quickie function that uses yn.sh to continue or ext after each test.
function continue() {
	if yn "
Continue to next test? (Y/n) " 0 Y; then
		return 0;
	fi
	return 1;
}


# Start the tests

echo -e "\n\E[1;36mTest #1: yn version information"; tput sgr0
echo -e "Usage: \E[1myn --version\n"; tput sgr0
yn --version

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #2: yn display help"; tput sgr0
echo -e "Usage: \E[1myn --help\n"; tput sgr0
yn --help

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #3: No parameters"; tput sgr0
echo -e "Usage: \E[1mif yn; then"; tput sgr0
echo "(Note: since there no PROMPT is given, nothing will be displayed while"
echo -e "waiting for you to press enter.)\n"
if yn; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #4: a prompt with no other parameters"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \"; then"; tput sgr0
if yn "Yes or no? "; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #5: a prompt, timeout is 0, no default set"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 0; then"; tput sgr0
if yn "Yes or no? " 0; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #6: a prompt, timeout is 5, no default set"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 5; then"; tput sgr0
if yn "Yes or no? " 5; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #7: a prompt, timeout is 0, default set to Y"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 0 Y; then"; tput sgr0
if yn "Yes or no? " 0 Y; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #8: a prompt, timeout is 0, default set to N"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 0 N; then"; tput sgr0
if yn "Yes or no? " 0 N; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #9: a prompt, timeout is 5, default set to Y"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 5 Y; then"; tput sgr0
if yn "Yes or no? " 5 Y; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

if ! continue; then exit; fi


echo -e "\n\E[1;36mTest #10: a prompt, timeout is 5, default set to N"; tput sgr0
echo -e "Usage: \E[1mif yn \"Yes or no? \" 5 N; then"; tput sgr0
if yn "Yes or no? " 5 N; then
	echo "Your response was recorded as \"Yes\".";
else
	echo "You response was recorded \"No\".";
fi

echo -e "\n\E[1;36mEnd of tests."; tput sgr0
