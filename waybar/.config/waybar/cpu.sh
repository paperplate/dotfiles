#!/bin/bash

# 1. Get the 1-minute system load average
load=$(cut -d ' ' -f 1 /proc/loadavg)

# 2. Get the CPU temperature (Looks for AMD's k10temp/zenpower or Intel's coretemp)
temp="N/A"
for hwmon in /sys/class/hwmon/hwmon*; do
  if [ -f "$hwmon/name" ]; then
    name=$(cat "$hwmon/name")
    if [[ "$name" == *"k10temp"* || "$name" == *"zenpower"* || "$name" == *"coretemp"* ]]; then
      # temp1_input is usually Tctl or Package temp
      if [ -f "$hwmon/temp1_input" ]; then
        temp_raw=$(cat "$hwmon/temp1_input")
        temp=$((temp_raw / 1000))
        break
      fi
    fi
  fi
done

# 3. Output JSON for Waybar
echo "{\"text\": \"$load\", \"tooltip\": \"CPU Temp: $temp°C\"}"
