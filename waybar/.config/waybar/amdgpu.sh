#!/bin/bash

# 1. Find the AMD GPU directory based on the PCI vendor ID (0x1002)
amdgpu_card=$(ls -d /sys/class/drm/card* 2>/dev/null | grep -E "card[0-9]+$" | while read card; do
  if [ -f "$card/device/vendor" ]; then
    vendor=$(cat "$card/device/vendor")
    if [ "$vendor" = "0x1002" ]; then
      echo "$card"
      break
    fi
  fi
done)

# If no AMD GPU is found, exit gracefully
if [ -z "$amdgpu_card" ]; then
  echo "{\"text\": \"N/A\", \"tooltip\": \"No AMD GPU found\"}"
  exit 0
fi

# 2. Get Utilization
usage=$(cat "$amdgpu_card/device/gpu_busy_percent" 2>/dev/null || echo "0")

# 3. Get Temperature
temp="N/A"
for hwmon in /sys/class/hwmon/hwmon*; do
  if [ -f "$hwmon/name" ] && [ "$(cat $hwmon/name)" = "amdgpu" ]; then
    if [ -f "$hwmon/temp1_input" ]; then
      temp_raw=$(cat "$hwmon/temp1_input")
      temp=$((temp_raw / 1000)) # Convert millidegrees to degrees
      break
    fi
  fi
done

# 4. Output JSON for Waybar
echo "{\"text\": \"$usage\", \"tooltip\": \"iGPU Temp: $temp°C\"}"
