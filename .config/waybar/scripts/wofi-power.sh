#!/bin/bash

# 1. กำหนดตัวเลือกและ Icon (แก้ข้อความตรงนี้ได้เลย)
shutdown="⏻ Shutdown"
reboot=" Reboot"
logout="󰍃 Logout"
lock=" Lock"
suspend="⏾ Suspend"

# 2. ส่งค่าไปให้ wofi แสดงผล (เรียงลำดับบรรทัดได้ตรง echo -e)
# --dmenu คือโหมดรับค่า
# --prompt คือข้อความหัวข้อ
selected_option=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | wofi --dmenu --prompt "Power Menu" --location top_right --x 10 --y 10 --width 250 --height 260 --cache-file /dev/null)

# 3. เช็คว่าเลือกอะไรมา แล้วสั่งคำสั่งนั้น
case $selected_option in
"$shutdown")
  systemctl poweroff
  ;;
"$reboot")
  systemctl reboot
  ;;
"$logout")
  hyprctl dispatch exit
  ;;
"$lock")
  # ตรงนี้แก้เป็นตัว Lock screen ที่คุณใช้นะครับ (เช่น hyprlock, swaylock)
  pidof hyprlock || hyprlock
  ;;
"$suspend")
  systemctl suspend
  ;;
*)
  # ถ้ากด esc หรือไม่เลือกอะไร ก็ไม่ต้องทำอะไร
  ;;
esac
