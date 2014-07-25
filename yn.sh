#!/bin/bash
#
# Script to prompt for a yes or no response from the user.
# Copyright (C) 2014 by Will Murray (Willscrlt) - Some Rights Reserved
# Permission to copy and modify is granted under the LGPL v3 or later license.
# Last revised 2005-07-25
#
# Usage:  if yn \"[PROMPT]\" <TIMEOUT> [DEFAULT]; then ...
#   -or-  yn --help
#   -or-  yn --version
# 

function yn() {
        # Use case-insensitive comparisons
        shopt -s nocasematch

	# Get the prompt or command to display, if any
	theprompt="$1"

        # Display some basic help if called with no parameters or if help is requested
	case "$theprompt" in
		/? | -h | --help ) {

                        echo "Usage: if yn \"[PROMPT]\" <TIMEOUT> [DEFAULT]; then ..."
                        echo "yn (Yes or No) is a simple Bash shell script for Linux that waits for a"
			echo "yes or no response from the user with an optional custom PROMPT, TIMEOUT,"
			echo "and/or optional DEFAULT value. Repeats until valid input is received or"
			echo -e "the timeout expires.\n"

                        echo "  /?, --help                   display this help and exit"
                        echo "  -v, --version                output version information and exit"
                        echo -e "\n"

                        echo -e "\E[1mPROMPT\E[0m is the optional message you want displayed for the prompt. Pass an"; tput sgr0
                        echo -e "empty string (\"\") if you do not want any prompt displayed.\n"

                        echo -e "\E[1mTIMEOUT\E[0m is the number of seconds to wait for input. To disable the timeout"; tput sgr0
                        echo -e "and wait forever for an entry, set TIMEOUT to 0.\n"

                        echo -e "\E[1mDEFAULT\E[0m can be omitted or set to either Y or N. If set to Y, the entry will"; tput sgr0
                        echo "default to Y if the timeout expires or if the user presses Enter. If set"
                        echo "to N, the entry will default to N instead. If DEFAULT is not set or is set"
                        echo "to 0, then only a response of Y or N will be accepted; blank entries will"
                        echo "be rejected. However, if TIMEOUT is set to a number greater than 0 and"
                        echo "DEFAULT is not set, then N (which is usually the safest option) will be"
                        echo -e "used as the default value.\n"

                        echo "Exit status:"
                        echo "  0  if the entry evaluated to Yes "
                        echo "  1  if the entry evaluated to No"
			echo -e "\nNote: this may seem backward, but it works with \E[1mif\E[0m like this:"; tput sgr0
			echo -e "| \E[1mif\E[0m yn; \E[1mthen\E[0m\n|   #true\n| \E[1melse\E[0m\n|   #false\n| \E[1mfi\E[0m"; tput sgr0
			echo -e "See also <http://www.gnu.org/software/bash/manual/bashref.html#Exit-Status>\n"

                        echo "GIT page: <tbd>"
                        echo "Forked from:    <https://gist.github.com/davejamesmiller/1965569>"
                        echo "Forked by:      Will Murray (Willscrlt) <http://willmurray.name/>"
                        echo "Bug reports to: <http://willmurray.name/contact>"
                        } ;;
                /v | -v | --ver* ) {
                        echo "bash-yn 1.0.0 by Will Murray (Willscrlt)"
			echo "Copyright (c) 2014; licensed under the LGPL v3 or later."
			echo "See <https://github.com/Willscrlt/bash-yn> for more information."
                        } ;;
                * ) {

			# Determine the timeout; 0 (meaning no timeout) is the default
			if [[ "${2:-0}" = "0" ]]; then
				timeout=""
			else
				timeout="-t $2 "
			fi

			# Determine the default response for timeouts or blank entries
			if [[ "${3:-}" = "Y" ]]; then
				default=Y
			elif [[ "${3:-}" = "N" ]]; then
				default=N
			else
				# If there is no default set but there is a timeout,
				# default to N (which is usually the safest choice)
				if [[ "$timeout" != "" ]]; then
					default=N
				else
					default=
				fi
			fi

			# Get the user's response
			read $timeout -p "$theprompt" response

			# Loop until a valid response is received
                        while true; do

                                # Blank responses get set to the default
                                if [[ -z "$response" ]]; then
                                        response=$default
                                fi

                                # Check if the reply is valid
                                case "$response" in
                                        Y*) return 0 ;;
                                        N*) return 1 ;;
                                esac

				echo -n -e "\E[1mY\E[0m (or \E[1myes\E[0m) or \E[1mN\E[0m (or \E[1mno\E[0m)? "; tput sgr0

				read response

                        done
                        } ;;

        esac
        shopt -u nocasematch
}
