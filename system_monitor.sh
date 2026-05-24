#!/bin/bash

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

LOG_FILE="logs/system_monitor.log"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p logs

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    MESSAGE="[ALERT] Disk usage is high: ${DISK_USAGE}%"
    echo "$MESSAGE"
    echo "$TIMESTAMP - $MESSAGE" >> "$LOG_FILE"
else
    echo "[OK] Disk usage is normal: ${DISK_USAGE}%"
fi

MEMORY_USAGE=$(free | awk '/Mem/ {printf("%.0f", $3/$2 * 100)}')

if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    MESSAGE="[ALERT] Memory usage is high: ${MEMORY_USAGE}%"
    echo "$MESSAGE"
    echo "$TIMESTAMP - $MESSAGE" >> "$LOG_FILE"
else
    echo "[OK] Memory usage is normal: ${MEMORY_USAGE}%"
fi

# Top CPU Consuming Processes

echo ""
echo "Top 5 CPU Consuming Processes"
echo "--------------------------------"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

# Top Memory Consuming Processes

echo ""
echo "Top 5 Memory Consuming Processes"
echo "-----------------------------------"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6


