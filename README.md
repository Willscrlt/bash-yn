bash-yn
=======

A simple Bash shell script for Linux that waits for a yes or no response from
the user with an optional custom prompt, customizable timeout, and/or optional
default value. Repeats until valid input is received. Returns either 0 (for a
no response) or 1 (for a yes).

Version 1.0.0 (2014-07-25): Initial release

The built-in help describes the function:
```bash
Usage: if yn "[PROMPT]" <TIMEOUT> [DEFAULT]; then ...
yn (Yes or No) is a simple Bash shell script for Linux that waits for a
yes or no response from the user with an optional custom PROMPT, TIMEOUT,
and/or optional DEFAULT value. Repeats until valid input is received or
the timeout expires.

  /?, --help                   display this help and exit
  -v, --version                output version information and exit


PROMPT is the optional message you want displayed for the prompt. Pass an
empty string ("") if you do not want any prompt displayed.

TIMEOUT is the number of seconds to wait for input. To disable the timeout
and wait forever for an entry, set TIMEOUT to 0.

DEFAULT can be omitted or set to either Y or N. If set to Y, the entry will
default to Y if the timeout expires or if the user presses Enter. If set
to N, the entry will default to N instead. If DEFAULT is not set or is set
to 0, then only a response of Y or N will be accepted; blank entries will
be rejected. However, if TIMEOUT is set to a number greater than 0 and
DEFAULT is not set, then N (which is usually the safest option) will be
used as the default value.

Exit status:
  0  if the entry evaluated to Yes 
  1  if the entry evaluated to No

Note: this may seem backward, but it works with `if` like this:
| **if** yn; **then**
|   #true
| **else**
|   #false
| **fi**
See also <[http://www.gnu.org/software/bash/manual/bashref.html#Exit-Status]>

GIT page:       <[https://github.com/Willscrlt/bash-yn]>
Created by:     **Will Murray (Willscrlt)** <[http://willmurray.name/]>
Bug reports to: <[http://willmurray.name/contact]>
```

For additional examples, just run the included **test_yn.sh** file.
