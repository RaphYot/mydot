#
# Created by Raphael Wouters on jeu,09 jan 2003
# bashrc@raph.udev.org
#

#export LC_MESSAGES="fr_BE.UTF-8"
#export LC_CTYPE="fr_BE.UTF-8"
#export LC_TIME="fr_BE.UTF-8"
#export LC_MONETARY="fr_BE.UTF-8"
#export LC_MESSAGES="fr_BE.UTF-8"
#export LC_PAPER="fr_BE.UTF-8"
#export LC_NAME="fr_BE.UTF-8"
#export LC_ADDRESS="fr_BE.UTF-8"
#export LC_TELEPHONE="fr_BE.UTF-8"
#export LC_MEASUREMENT="fr_BE.UTF-8"
#export LC_IDENTIFICATION="fr_BE.UTF-8"
#export LC_COLLATE="C"

export VISUAL=vim
export EDITOR=vim

export PATH=/home/rawouter/bin:/home/rawouter/local/bin:/home/rawouter/local/scripts:/opt/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"


alias p='ptpython --vi'
alias ls='ls -G'
alias ll='ls -lrt'
alias la='ls -lart'
alias l='ls -la'

alias grep="grep --color"

#PROMPT_USER_COLOR - Color for username (e.g. todd)
#PROMPT_PREPOSITION_COLOR - Color for 'at', 'in', 'on'
#PROMPT_DEVICE_COLOR - Color for machine name (e.g. Euclid)
#PROMPT_DIR_COLOR - Color for directory (e.g. ~/github/sexy-bash-prompt)
#PROMPT_GIT_STATUS_COLOR - Color for git branch and symbol (e.g. master)
#PROMPT_GIT_PROGRESS_COLOR - Color for in progress git actions (e.g. [merge])
#PROMPT_SYMBOL_COLOR - Color for prompt symbol (e.g. $)
if [ -n "$SSH_CLIENT"  ] || [ -n "$SSH_TTY"  ]; then
    export PROMPT_DIR_COLOR="\[\e[0;31m\]"
else
    export PROMPT_DIR_COLOR="\[\e[0;33m\]"
fi
export PROMPT_DEVICE_COLOR=""
export PROMPT_USER_COLOR="\[\e[0;32m\]"
export PROMPT_PREPOSITION_COLOR=""
export PROMPT_VENV_COLOR="\[\e[0;36m\]"
export PROMPT_GIT_STATUS_COLOR=""
export PROMPT_GIT_PROGRESS_COLOR=""
export PROMPT_SYMBOL_COLOR="\[\e[0;31m\]"
. ~/.bash_prompt

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# virtualenv
export PATH="/usr/local/lib/python2.7/site-packages:$PATH"
source /usr/local/bin/virtualenvwrapper.sh
