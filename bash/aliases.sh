# bash aliases
# included by .bashrc

# the motley crew of ls stuffs
#
# Better LS_COLORS
eval $(dircolors)
# Add color to less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias dir='ls --color=auto --format=vertical'
  alias vdir='ls --color=auto --format=long'
fi
alias ll='ls -l'
alias la='ls -A'
alias l='ls -G'
alias lla='ls -la'

alias t='tree -L 1 -C -h'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'
alias grep='grep --color'

alias v='vim'

# system monitoring
alias apache_process='ps -ef | grep apache | grep -v grep | wc -l'
alias topcpu='ps aux | sort -n +2 | tail -10'  # top 10 cpu processes
alias topmem='ps aux | sort -n +3 | tail -10'  # top 10 memory processes
alias psg='ps auxf | grep'

alias s='screen -X screen'

alias restart-tomcat='pkill -9 java ; /usr/local/apps/tomcat/bin/startup.sh ; tail -f /usr/local/apps/tomcat/logs/catalina.out'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'

function jcurl() {
  curl -i -H "Content-Type: application/json" -X POST -d $1 $2
}

function find_grep() {
  find $1 -name $2 | xargs egrep -nC3 $3 | less
}

function touch {
  dir=`expr "$1" : '\(.*\/\)'`
  if [ $dir ]
    then
mkdir -p $dir
  fi
  /usr/bin/touch $1
}