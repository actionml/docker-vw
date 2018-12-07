#!/bin/bash

# bold filter
bold() {
  echo -ne "\e[1m"
  cat
  echo -ne "\e[0m"
}

## SDK_VERBOSE output
#
if [ "$SDK_VERBOSE" = "yes" ]; then
  echo -n "=> " && mvn --version # maven makes the first line bold
  echo -n "=> " && scalac -version | bold
  echo -n "=> " && python --version | bold
fi

# execute command
[ -n "$*" ] && exec "$@" || exec /bin/bash
