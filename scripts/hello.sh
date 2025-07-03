#!/bin/bash

TIMESTAMP=$(TZ="Europe/Kyiv" date +"%Y%m%d_%H%M%S")
LOGS_DIR="logs"
OUTPUT_DIR="output"
HISTORY_FILE="$LOGS_DIR/history.txt"
CUSTOM_NAME="$1"

if [ -n "$CUSTOM_NAME" ]; then
    LOGNAME="log-$CUSTOM_NAME.txt"
else
    LOGNAME="log-$TIMESTAMP.txt"
fi

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

update_history() {
    echo "$TIMESTAMP $LOGNAME" >> "$HISTORY_FILE"
}

write_log
update_history