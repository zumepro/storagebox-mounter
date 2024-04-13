#!/bin/bash

# Login info
BOXADDR="user@myexternalstorage.tld"
BOXPASS="password"

echo "Unmounting storage box."

# Mounts data
source_data=$(cat /root/storagebox/mounts.txt);

IFS=$'\n';
for line in $source_data
do
        # Get current mountpoint info
        IFS=$'\t';
        read -r source target <<< "$line";

        # Unmount
        umount "$target" 2>/dev/null;
done
