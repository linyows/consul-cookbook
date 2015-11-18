#!/bin/bash

RETRY_COUNT=2
RETRY_INTERVAL=5s
COMMAND=""

usage() {
  echo "Usage: `basename "$0"` [-n $RETRY_COUNT] [-i $RETRY_INTERVAL] [-c]" 1>&2
  echo "  -n: retry count"
  echo "  -i: retry interval"
  echo "  -c: excute command"
  exit 1
}

while getopts n:i:c: OPT; do
  case $OPT in
    "n" ) RETRY_COUNT="$OPTARG" ;;
    "i" ) RETRY_INTERVAL="$OPTARG" ;;
    "c" ) COMMAND="$OPTARG" ;;
      * ) usage ;;
  esac
done

test "$COMMAND" = "" && usage

eval $COMMAND
if [ $? -ne 0 ]; then
  for i in $(seq 1 $RETRY_COUNT); do
    sleep $RETRY_INTERVAL
    eval $COMMAND
    exit_status=$?
    test $exit_status -eq 0 && exit 0
  done
fi

exit $exit_status
