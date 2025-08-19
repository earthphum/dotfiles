#!/usr/bin/env bash

# อ่านข้อมูลจาก acpi
read -r _ status percent _ <<< "$(acpi -b | sed 's/,//g' | awk '{print $1, $3, $4}')"

# เอาเฉพาะตัวเลขเปอร์เซนต์
percent="${percent%\%}"

# เลือกไอคอนตามสถานะ
if   [[ "$status" == "Charging"    ]]; then icon="⚡"  # กำลังชาร์จ
elif [[ "$status" == "Discharging" ]]; then icon="🔋"  # กำลังใช้ไฟ
else   icon="เต็มละอ้าย "                        # Unknown หรือ Full
fi

# แสดงผล เช่น "🔋 57%"
echo "$icon $percent%"
