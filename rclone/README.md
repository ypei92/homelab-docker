### Files smaller than disk size
Just use Linux `cp`

### Files larger than disk size
Disk won't be large enough to hold all the cache, causing truncation.
Instead, use `rclone copy` directly.
```
docker compose run --rm rclone copy /mnt/external_drive/backup/xxx "onedrive:backup/xxx" -P
```
