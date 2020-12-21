#!/usr/bin/env bash
xhost +SI:localuser:root
sudo xkeysnail $HOME/.xkeysnail/config.py -q &
