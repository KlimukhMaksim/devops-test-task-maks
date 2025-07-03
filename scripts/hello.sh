#!/bin/bash

TIMEZONE="Europe/Kyiv"
TIMESTAMP=$(TZ="$TIMEZONE" date +"%Y%m%d_%H%M%S")
LOGNAME="log-$TIMESTAMP.txt"
LOGS_DIR="logs"
OUTPUT_DIR="output"

hello() {
  echo "Hello from Bash!"
}

print_timestamp() {
  echo "Date_time: $TIMESTAMP"
}

count_files() {
  find "$OUTPUT_DIR" -type f | wc -l
}

write_log() {
  mkdir -p "$LOGS_DIR"
  {
    hello
    print_timestamp
    echo "File count: $(count_files)"
  } | tee "$LOGS_DIR/$LOGNAME"
}

write_log