#!/bin/bash

# File to save the output
OUTPUT_FILE="output/appops_output_$(date +%s).txt"

# Check if adb is installed
if ! command -v adb &> /dev/null; then
    echo "adb command not found. Please install adb and try again."
    exit 1
fi

# Check if device is connected
adb devices | grep -w "device" > /dev/null
if [ $? -ne 0 ]; then
    echo "No device connected. Please connect a device and try again."
    exit 1
fi

# Clear the output file if it exists
> $OUTPUT_FILE

# Get the list of installed packages
packages=$(adb shell pm list packages | awk -F ':' '{print $2}')

# Check if we got any packages
if [ -z "$packages" ]; then
    echo "No installed packages found."
    exit 1
fi

# Loop through each package and get app ops
for pkg in $packages; do
    # Skip packages starting with com.google or com.android
    if [[ $pkg == com.google* || $pkg == com.android* ]]; then
        continue
    fi

    echo "  ⚙️ Getting app ops for package: $pkg" | tee -a $OUTPUT_FILE
    echo ""  | tee -a $OUTPUT_FILE
    adb shell cmd appops get $pkg | tee -a $OUTPUT_FILE
    echo "----------------------------------------" | tee -a $OUTPUT_FILE
done

echo "Output saved to $OUTPUT_FILE"