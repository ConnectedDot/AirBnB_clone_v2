#!/usr/bin/env bash
# Transfer a file from the clientside to serverside
#
# Variables
path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
filename=$(basename "$BASH_SOURCE")
brown='\e[0;33m'
reset='\033[0m'
file="$1"
ip="$2"
user="ubuntu"
keys="~/.ssh/id_rsa"

if [ $# -eq 2 ]; then
  scp -i "$keys" -o StrictHostKeyChecking=no "$path/$file" "$user@$ip:/home/$user/"
else
  echo -e "Usage: ${brown}$filename PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY${reset}"
fi