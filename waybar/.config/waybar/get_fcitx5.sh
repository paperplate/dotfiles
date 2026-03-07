#!/bin/bash

# Get current input methon from fcitx5
current=$(fcitx5-remote -n 2>/dev/null)

case "$current" in
  "keyboard-us") echo "EN" ;;
  "keyboard-pinyin") echo "中文" ;;
  *) echo "${current^^}" ;; # fallback: uppercase the name
esac
