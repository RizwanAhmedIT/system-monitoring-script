> ./system_monitor.sh
[ALERT] Disk usage is high: 94%
[OK] Memory usage is normal: 71%

Top 5 CPU Consuming Processes
--------------------------------
    PID    PPID CMD                         %MEM %CPU
 188953  188943 ps -eo pid,ppid,cmd,%mem,%c  0.0  300
 188887  107382 /opt/google/chrome/chrome -  2.1 98.3
 177992    4538 /opt/brave.com/brave/brave   2.7 23.2
 186751  107382 /opt/google/chrome/chrome -  3.1 19.8
 185851  185729 /snap/code/240/usr/share/co  2.2 16.0

Top 5 Memory Consuming Processes
-----------------------------------
    PID    PPID CMD                         %MEM %CPU
   5142    4538 /opt/brave.com/brave/brave   4.4  0.7
 107361    2886 /opt/google/chrome/chrome    4.3  0.7
   4522    4514 /opt/brave.com/brave/brave   4.1  1.9
 185926  185724 /proc/self/exe --type=utili  3.7 11.2
 135670  107382 /opt/google/chrome/chrome -  3.2  5.0
