#!/usr/bin/env bash

eventsToListen="CREATE,CLOSE_WRITE,DELETE,MODIFY,MOVED_FROM,MOVED_TO"
currentPath=`pwd`

localPath="/home/tomascayuelas/Development/Sources/Own/poupermo-api/"
remotePath="/home/tomascayuelas/Development/Sources/Own/poupermo-api/"
pathsToIgnore="(.git|.lock|.idea|_jb_old_|_jb_bak_|___jb_tmp___|noodle-api/vendor|noodle-api/var/cache|noodle-api/var/logs)"

inotifywait -mr --timefmt '%d-%m-%y %H:%M:%S' --format '%T %w %f' --exclude $pathsToIgnore -e "$eventsToListen" $localPath |
while read date time dir file; do
    fileChangedAbsolute="${dir}${file}"
    fileChangedRelative=`echo "$fileChangedAbsolute" | sed 's_'$currentPath'/__'`
    echo "[${date} ${time}] SYNC >> ${currentPath}/${fileChangedRelative}";
    rsync -azvuq --delete $localPath gdevel:$remotePath
    rsync -azvuq --delete gdevel:$remotePath $localPath
done