#!/bin/bash

# Check for input
if [ $# -eq 0 ]; then
	echo "Please enter a port $0 <number>"
	exit 1
fi


PORT=$1
# Check if the input is a valid port 
if ! [[ $PORT =~ ^[0-9]{4}$ ]]; then
	echo "Error: '$PORT' is not a valid port."
    	exit 1
fi


listening_pid=$(lsof -i tcp:$PORT | grep LISTEN | awk '{print $2}')

# Check if the result is not empty
if [ -n "$listening_pid" ]; then
	kill -9 $listening_pid
    	echo "Process ID(s) listening on port $PORT: $listening_pid was successfully killed"
else
    	echo "No process is currently listening on port $PORT."
fi

