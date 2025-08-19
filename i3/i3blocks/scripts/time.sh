#!/bin/bash

TOGGLE_FILE="/tmp/i3blocks_time_show_date"

# ถ้าไม่มี BLOCK_BUTTON แสดงสถานะปัจจุบัน
if [ -z "$BLOCK_BUTTON" ]; then
    if [ -f "$TOGGLE_FILE" ]; then
        date '+%a %d %b %Y %H:%M:%S'  # แสดงวันที่และเวลา
    else
        date '+%H:%M:%S'              # แสดงแค่เวลา
    fi
    exit 0
fi

# ถ้ามีการคลิก (block mouse click) ให้ toggle สถานะ
if [ -f "$TOGGLE_FILE" ]; then
    rm "$TOGGLE_FILE"
else
    touch "$TOGGLE_FILE"
fi

# รีเฟรช block นี้ (ส่งสัญญาณให้ i3blocks รีเฟรช block ที่สัญญาณ 10)
pkill -RTMIN+10 i3blocks
