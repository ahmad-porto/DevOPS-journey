#!/bin/bash

# TOTAL CPU USAGE IN PERCENT
echo -e "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'

# TOTAL MEMORY USAGE IN PERCENT
echo -e "\nTotal Memory Usage:"
free -m | grep "Mem:" | awk '{printf "%.2f%%\n", $3/$2*100}'

# TOTAL DISK USAGE IN PERCENT
echo -e "\nTotal disk Usage:"
df -h / | awk '/\// {print $5}'

# TOP 5 CPU USAGE
echo -e "\nTop 5 CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

#TOP 5 MEMORY USAGE
echo -e "\nTop 5 disk Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6