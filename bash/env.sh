# Environment variables

export TERM="xterm-color"

# Don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# Larger bash history (default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Make some commands not show up in history
export HISTIGNORE="pwd;exit:date:* --help"

# set the default editor
export EDITOR=vim

export JAVA_OPTS="-server -Xms4096M -Xmx4096M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2048m"
export JAVA_HOME=/usr/java/latest
export M2_HOME=/usr/local/apps/maven