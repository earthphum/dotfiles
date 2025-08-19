#!/bin/bash

yad --notification \
    --image=system-shutdown \
    --text="Power menu" \
    --menu='Shutdown!sudo shutdown now|Reboot!sudo reboot|Sleep!systemctl suspend|Logout!i3-msg exit' \
    --command="" \
    --no-middle
