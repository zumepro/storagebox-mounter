# External storage mounter

By Ondřej Mekina and Michal Procházka.

### How to install
1. Put the service from `storagebox.service` to systemd service location. `/usr/lib/systemd/system/` for example.

2. Put the folder `storagebox` into `/root`. So that the files are in the location `/root/storagebox/`. Or if you wish to install to a different location - update the service first.

3. Add desired mountpoint to `/root/storagebox/mounts.txt`. One mount is one line. The mount info is separated with tabs in the file and has the following structure:
```
<mount_source_on_external>\t<mount_target_on_local>\t<user_id_on_local>\t<group_id_on_local>
```

4. `systemctl enable --now storagebox` or just start `systemctl start storagebox` (if you do not wish for it to active on boot).
