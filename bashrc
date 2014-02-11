# ~/.bashrc: executed by bash(1) for non-login shells.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# tab completion only for directories when using 'cd'
complete -d cd

# vi editing mode in bash
set -o vi

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete

# enable programmable completion features
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

for a in `ls $HOME/.bash/*.sh`; do
  source $a
done

# Include local configuration
if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

# git completion!
source ~/.git-completion.bash

# Make a cool prompt
. /root/dotfiles/bash_prompt

PATH=/usr/local/apps/maven/bin:/usr/local/apps/tomcat/bin:/usr/local/apps/cas-json-tool/bin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/root/.gvm/bin/gvm-init.sh" ]] && source "/root/.gvm/bin/gvm-init.sh"
