#!/bin/bash

# Login info
BOXADDR="user@myexternalstorage.tld"
BOXPASS="password"

echo "Starting storage box mounter."

# Mounts data
source_data=$(cat /root/storagebox/mounts.txt);

while true; do
        IFS=$'\n';
        for line in $source_data
        do
                # Get current mountpoint info
                IFS=$'\t';
                read -r source target <<< "$line";

                # Check if is mounted
                mountpoint "$target" &>/dev/null;
                if [[ "$?" == "0" ]]
                then
                        continue;
                fi

                # Mount if not mounted
                echo "\"$target\" not mounted. Mounting from \"$source\".";
                umount "$target" 2>/dev/null;
                echo "$BOXPASS" | sshfs -o allow_other,password_stdin "$BOXADDR:$source" "$target";
        done

        # Wait between iterations
        sleep 30
done
