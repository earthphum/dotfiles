#!/usr/bin/env bash

# ปรับ INTERFACE ให้ตรงกับเครื่อง (เช่น enp3s0, eth0, wlan0)
IFACE="${1:-$(ip route get 1.1.1.1 2>/dev/null | awk '/dev/ {for(i=1;i<=NF;i++) if ($i == "dev") print $(i+1)}')}"

[ -z "$IFACE" ] && echo "no-if" && exit 0

RX_OLD=$(cat /sys/class/net/"$IFACE"/statistics/rx_bytes)
TX_OLD=$(cat /sys/class/net/"$IFACE"/statistics/tx_bytes)
sleep 1
RX_NEW=$(cat /sys/class/net/"$IFACE"/statistics/rx_bytes)
TX_NEW=$(cat /sys/class/net/"$IFACE"/statistics/tx_bytes)

RX_DIFF=$((RX_NEW - RX_OLD))
TX_DIFF=$((TX_NEW - TX_OLD))

human() {
  local bytes=$1
  local kib=$((1024))
  local mib=$((1024 * 1024))
  local gib=$((1024 * 1024 * 1024))

  if [ "$bytes" -ge "$gib" ]; then
    printf "%.1fGiB/s" "$(echo "$bytes / $gib" | bc -l)"
  elif [ "$bytes" -ge "$mib" ]; then
    printf "%.1fMiB/s" "$(echo "$bytes / $mib" | bc -l)"
  elif [ "$bytes" -ge "$kib" ]; then
    printf "%.1fKiB/s" "$(echo "$bytes / $kib" | bc -l)"
  else
    printf "%dB/s" "$bytes"
  fi
}

DOWN=$(human "$RX_DIFF")
UP=$(human "$TX_DIFF")

echo "↓ $DOWN ↑ $UP"
