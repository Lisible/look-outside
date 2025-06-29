#!/bin/sh

if [ "$(uname)" = "Linux" ]; then
  ICON_BASE64='iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAYAAADDPmHLAAAAAXNSR0IB2cksfwAAAARnQU1BAACxjwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAZiS0dEAAAAAAAA+UO7fwAAAAlwSFlzAAAuIwAALiMBeKU/dgAAAAd0SU1FB+kGHQgpCeMl7P8AAAHRSURBVHja7d1BUsIwGIDRxnHDJfQCHoElnBqWHMEL6BVcsIxbxkVS56dp2rw3w4qx0vYznaQC0wQAAACMIm3gNeaF92Hr2w958TcwNgEIAAEgAASAABjN6wbm+aNv3wiAABAAAkAACAAB8Cwt7kVnh7nfc2QEcAlAAAgAASAABIA5Zst5/uXyVXz+cPgpPn88fnR9gGv7dz6/r3oOjQAuAQgAASAABIAAGMqc9wWE5vk5l3/8ev3uep5fe/01tf2rbT+lFD0/yQiAABAAAkAACAAB8I91gEXn+WuLzvOjGqwTGAEQAAJAAAgAASAAHtcBvH9/37IRAAEgAASAABAAAuBhHaA8icz7Xiao3U/vff+j/y9gBHAJQAAIAAEgAATAcAGk0iOlNJUee1fb/7WPz4zfXzy/RgAjAAJAAAgAASAAhhL+fIDo/fTePz9gaafTW+j4GgEQAAJAAAgAASAAnrwOUJuI5sg8tva9erfbZ/H5tb9PoPb67vdp6Xm+7w1EAAgAASAABIAAaDKHnMnnEHZ8jowALgEIAAEgAASAADDHbCwvvA9b374RAAEgAASAABAAAmBP6wDRdYI0+PaNAAgAASAABIAAEAAAAAAAf/0CxzJQ+/HsqEwAAAAASUVORK5CYII='
  ICON_FILE=$(mktemp /tmp/look-outside.icon.png.XXXXXX)
  echo "$ICON_BASE64" | base64 --decode > "$ICON_FILE"
fi

send_notification() {
  local message="$1"

  if [ "$(uname)" = "Darwin" ]; then
        osascript -e "display notification \"$message\" with title \"Look outside!\""
        sleep 1
  else
        notify-send -w -t 1000 -i "$ICON_FILE" "$message" > /dev/null 2>&1
  fi
}

while true; do
  for i in $(seq 20 -1 1); do
    send_notification "Time to look outside! Please take a moment to enjoy the view. Time remaining: $i seconds."
  done
  sleep 1200
done
