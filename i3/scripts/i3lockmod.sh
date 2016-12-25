#!/bin/bash

tmp_folder="/tmp"
image_name="screen_locked.png"

scrot $tmp_folder/$image_name
convert $tmp_folder/$image_name -blur 0x5 $tmp_folder/$image_name
i3lock -i $tmp_folder/$image_name
