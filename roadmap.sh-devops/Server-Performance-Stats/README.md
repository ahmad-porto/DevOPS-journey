# Server Performance Stats

`server-stats.sh` is a simple shell script to display key performance metrics of your Linux server.

## How it Works

The script provides the following information:

*   **Total CPU Usage:** Calculates and displays the total CPU utilization as a percentage. It uses `top` to get CPU information and `awk` to calculate the usage from the idle time.
*   **Total Memory Usage:** Shows the total memory usage as a percentage. It uses `free` to get memory statistics and `awk` to calculate the percentage of used memory.
*   **Total Disk Usage:** Displays the total disk usage for the root partition (`/`) as a percentage. It uses `df` to get disk information and `awk` to extract the usage percentage.
*   **Top 5 Processes by CPU Usage:** Lists the top 5 processes consuming the most CPU. It uses `ps` to list processes with their PID, PPID, command, and CPU percentage, then sorts them by CPU usage.
*   **Top 5 Processes by Memory Usage:** Lists the top 5 processes consuming the most memory. It uses `ps` to list processes with their PID, PPID, command, and memory percentage, then sorts them by memory usage.

## How to Use

### 1. Make the script executable

You need to give the script execute permissions.

```bash
chmod +x server-stats.sh
```

### 2. Run the script

You can now execute the script from your terminal.

```bash
./server-stats.sh
```

This will display the current server performance statistics on your terminal.
