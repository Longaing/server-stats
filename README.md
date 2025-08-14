# Project Roadmap URL

https://roadmap.sh/projects/server-stats

# Server Stats Script

A Bash script to analyze the performance of my Linux server.

## Features

- CPU statistics
- Memory usage
- Disk usage
- Top processes
- System information

## Usage

```
chmod +x server-stats.sh
./server-stats.sh
```

## Output from my PC

```
dell@dell:~/server-stats$ ./server-stats.sh
=====================================
     Statistiques du Serveur
=====================================

===== Informations Système =====
OS: Ubuntu 24.04.3 LTS
Kernel: 6.14.0-27-generic
Uptime: up 22 hours, 28 minutes

===== Utilisation CPU =====
Utilisation totale: 91%
Charge moyenne:  1,86, 1,73, 2,05

===== Utilisation Mémoire =====
Utilisée: 7885/15876MB (49,67%)
Swap: 0/4095MB (0,00%)

===== Utilisation Disque =====
/dev/sda2: 15%
efivarfs: 39%
/dev/sda1: 1%

===== Top 5 Processus CPU =====
    PID    PPID CMD                         %MEM %CPU
  54170   54148 ps -eo pid,ppid,cmd,%mem,%c  0.0  700
  46050   45495 /snap/tradingview/66/tradin  1.6 31.1
  50193   50091 /snap/code/204/usr/share/co  1.9 17.8
  41112    6987 /proc/self/exe --type=rende  1.7 15.7
  54090    3256 /usr/libexec/gnome-terminal  0.3 11.8

===== Top 5 Processus Mémoire =====
    PID    PPID CMD                         %MEM %CPU
   4356    3256 /snap/firefox/6638/usr/lib/  5.5  9.3
  33044    4562 /snap/firefox/6638/usr/lib/  3.5  1.8
  14429    4562 /snap/firefox/6638/usr/lib/  2.8  2.9
  50983   50088 /proc/self/exe --type=utili  2.8  7.8
   5164    4562 /snap/firefox/6638/usr/lib/  2.6  2.3

===== Statistiques Avancées =====
Utilisateurs connectés: 2
lastb: impossible d'ouvrir /var/log/btmp: Permission non accordée
Échecs de connexion récents: 0

=====================================
Statistiques générées le: jeu. 14 août 2025 10:42:48 CEST
=====================================
```