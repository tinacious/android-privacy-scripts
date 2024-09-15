#!/bin/bash

echo "";
echo '  🤷🏻‍♀️ Clipboard permissions before script:'
echo "";

adb shell cmd appops query-op --user 0 READ_CLIPBOARD allow

echo "";
echo '  💥 Paste a list of package names you would like to remove clipboard read permissions for and press Ctrl+D when done:'
echo "";

TARGET_APPS=()
while IFS= read -r line
do
  # Add each non-empty line to TARGET_APPS array
  [[ -n "$line" ]] && TARGET_APPS+=("$line")
done

for target_app in "${TARGET_APPS[@]}"
do
  echo "";
  echo "⏳ Attempting to remove READ_CLIPBOARD permissions from app: $target_app"
  adb shell cmd appops set $target_app READ_CLIPBOARD ignore
done

echo "";
echo '  ✅ Clipboard permissions after script:'
echo "";
adb shell cmd appops query-op --user 0 READ_CLIPBOARD allow