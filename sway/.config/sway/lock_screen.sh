#!/bin/sh

img_path="/tmp/lockscreen.png"

grim "$img_path" || exit 1

swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

swaylock -i "$img_path" --effect-blur 7x5 --clock

kill %%
