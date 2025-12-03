#!/bin/bash
NIGHT_COMMAND="wlsunset -t 4500"
if pgrep wlsunset >/dev/null; then
  pkill wlsunset &
  echo "☀️ Day Mode"
else
  $NIGHT_COMMAND &
  echo "🌙 Night Mode"
fi
