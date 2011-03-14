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
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Ubuntu/Debian package management
alias as="apt-cache search"
alias ash="apt-cache show"
alias ai="sudo apt-get install"
alias ar="sudo apt-get remove"
alias aud="sudo apt-get update"
alias aug="sudo apt-get upgrade"
alias auall="sudo apt-get update && sudo apt-get upgrade"
alias installed="sudo dpkg --get-selections | grep"

# RubyGems
alias gemu="sudo gem update"
alias gemi="sudo gem install --no-ri --no-rdoc"
alias gemun="sudo gem uninstall"
alias gemus="sudo gem update --system"
# install or search for a similarly named gem
function geminst() {
  sudo gem install $1 || gem search $1 -r ;
}

# Rails' script/[command] stuff
alias sst='script/server thin'
alias sgen='script/generate'
alias sc='script/console'

alias cuke='cucumber'
alias rdp='rake production deploy'

# Rails: migrate and clone to test, 'cause autotest needs it NOW
alias do-db='rake db:auto:migrate && rake db:test:clone'

alias rtu='rake test:units'
alias rtf='rake test:functionals'
alias rt='rake test'

alias annotate='annotate --position before --exclude tests,fixtures'

# autotest
alias atf='autotest -f'

alias v='vim'
alias gv='mvim'
alias sv='sudo vim'
alias apache='sudo /etc/init.d/apache2'

# show sorted directory sizes for all directories
alias dua='du -ch --max-depth=1'
alias duv='du -sch ./*'
alias duh='du -sch ./.*'

# human df
alias dfh='df -h'

# system monitoring
alias apache_process='ps -ef | grep apache | grep -v grep | wc -l'
alias topcpu='ps aux | sort -n +2 | tail -10'  # top 10 cpu processes
alias topmem='ps aux | sort -n +3 | tail -10'  # top 10 memory processes
alias psg='ps auxf | grep'

# systat - http://perso.orange.fr/sebastien.godard/index.html
alias sar2='sar -u 2 0'
alias sar5='sar -u 5 0'

# show what ports are open locally
alias local_ports='sudo nmap -sT -O localhost'

# my personal default options when using pwsafe
alias pwsf='sudo pwsafe -upE'

# GNU Screen
alias scrails='screen -c ~/.rails.screen'
alias s='screen -X screen'

# Postgresql
alias pggo='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# cURL
# alias jcurl='curl -i -H "Content-Type: application/json" -X POST -d'

function jcurl() {
  curl -i -H "Content-Type: application/json" -X POST -d $1 $2
}

function find_grep() {
  find $1 -name $2 | xargs egrep -nC3 $3 | less
}

alias mkdir='mkdir -p'

function touch {
  dir=`expr "$1" : '\(.*\/\)'`
  if [ $dir ]
    then
mkdir -p $dir
  fi
  /usr/bin/touch $1
}

# probably not a best practice, but works for a specific project
alias deliver='git push && cap deploy'
