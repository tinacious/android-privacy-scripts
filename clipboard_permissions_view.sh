#!/bin/bash

echo "";
echo "  👁️‍🗨️  The following apps have access to read your clipboard data";
echo "";
adb shell cmd appops query-op --user 0 READ_CLIPBOARD allow