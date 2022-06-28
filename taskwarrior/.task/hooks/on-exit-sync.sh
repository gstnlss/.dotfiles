#!/usr/bin/env bash

# reference: https://www.reddit.com/r/taskwarrior/comments/4mwhvk/a_script_to_autosync_after_every_modification/

n=0
while read modified_task
do
    n=$(($n + 1))
done

if (($n > 0)); then
    task sync >> ~/.task/sync_hook.log
fi

exit 0
