# Environment variables

export TERM="xterm-color"

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set the default editor
 export EDITOR=vim
# NOTE!  This is set to /usr/local/bin/vim due to an issue
# with Ubuntu 8.04's version of vim and rails.vim -- I installed
# from source a newer version of vim in /usr/local/bin/vim.  Typically,
# you'll just want the line noted above.
#export EDITOR=/usr/local/bin/vim

# For ODBC stuff
export ODBCINI=/etc/
export ODBCSYSINI=/etc/
export FREETDSCONF=/etc/freetds/freetds.conf

# For Clojure
#export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.1.0/clojure-contrib.jar
