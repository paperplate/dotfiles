# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# Created by `pipx` on 2025-11-07 00:30:18
export PATH="$PATH:/home/sean/.local/bin"

export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"

# add vulkan sdk setup
source ~/dev/vulkansdk/default/setup-env.sh

# add personal utility functions
source ~/dev/scripts/utils.sh

source <(jj util completion bash)

# setup for esp32 environment
esp() {
  git config --global --get-all safe.directory |
    grep -q '^/opt/esp-idf$' ||
    git config --global --add safe.directory /opt/esp-idf
  source /opt/esp-idf/export.sh
  alias idf=idf.py
  eval "$(env LANG=en \
    _IDF.PY_COMPLETE=bash_source \
    idf.py |
    sed -e 's,$1,$1.py,' \
      -e 's,idf\.py$,idf,' \
      -e 's,_idfpy_completion,_idfpy_completion2,')"
}
