#!/bin/bash

uuidgen | xclip -i -silent -selection clipboard
notify-send -u low "UUID generated and copied to clipboard"
prasdasd