
#!/bin/bash

# Titre et séparateur
echo "====================================="
echo "     Statistiques du Serveur"
echo "====================================="
echo ""

# Section 1: Informations système de base

# Affiche la version de l'OS
echo "===== Informations Système ====="
echo "OS: $(cat /etc/os-release | grep "PRETTY_NAME" | cut -d'"' -f2)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo ""

# notes de la section 1
# - /etc/os-release contient les infos sur l'OS
# - uname -r donne la version du kernel
# - uptime -p donne le temps depuis le démarrage

# Section 2: CPU

echo "===== Utilisation CPU ====="
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
echo "Utilisation totale: $cpu_usage"
echo "Charge moyenne: $(uptime | awk -F'load average:' '{print $2}')"
echo ""

# notes de la section 2
# - top -bn1: exécute top en mode batch (pour scripts)
# - grep/sed/awk: extrait le pourcentage d'inactivité et le soustrait de 100
# - uptime: montre la charge moyenne du système

# Section 3: Mémoire

echo "===== Utilisation Mémoire ====="
free -m | awk 'NR==2{printf "Utilisée: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
free -m | awk 'NR==3{printf "Swap: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2}'
echo ""

# notes de la section 3
# - free -m: montre la mémoire en MB
# - NR==2: ligne 2 (mémoire physique)
# - NR==3: ligne 3 (swap)

# Section 4: Disques

echo "===== Utilisation Disque ====="
df -h --output=source,pcent | awk 'NR>1 {print $1 ": " $2}' | grep -v "tmpfs"
echo ""

# notes de la section 4
# - df -h: espace disque en format lisible
# --output: sélectionne les colonnes
# - grep -v "tmpfs": exclut les systèmes de fichiers temporaires

# Section 5: Top processus

echo "===== Top 5 Processus CPU ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

echo "===== Top 5 Processus Mémoire ====="
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

# notes de la section 5
# - ps -eo: sélectionne les colonnes spécifiques
# --sort=-%cpu: tri par CPU descendant
# --sort=-%mem: tri par mémoire descendante
# head -n 6: montre les 5 premiers + en-tête

# Section 6: Statistiques avancées (optionnelles)

echo "===== Statistiques Avancées ====="
echo "Utilisateurs connectés: $(who | wc -l)"
echo "Échecs de connexion récents: $(lastb | wc -l)"
echo ""

# notes de la section 6
# - who: liste les utilisateurs connectés
# - wc -l: compte les lignes
# - lastb: montre les tentatives de connexion échouées

echo "====================================="
echo "Statistiques générées le: $(date)"
echo "====================================="
