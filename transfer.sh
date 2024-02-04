#!/usr/bin/env bash
# Transfer a file from the clientside to serverside
# execute: ./transfer.sh PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
# execute: ./transfer.sh 0-setup_web_static.sh 54.237.118.39	ubuntu ~/.ssh/id_rsa
#
# Variables
path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
filename=$(basename "$0")
brown='\e[0;33m'
reset='\033[0m'
file="$1"
ip="$2"
user="$3"
keys="$4"

if [ $# -eq 4 ]; then
  scp -r -i "$keys" -o StrictHostKeyChecking=no "$file" "$user@$ip:/home/$user/"
else
  echo -e "Usage: ${brown}$filename PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY${reset}"
fi
