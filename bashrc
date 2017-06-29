# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m' 



# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u->\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}->${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'


#others alias for linux
alias update='apt-get update'
alias upgrade='apt-get upgrade'
alias install='apt-get install'

alias firefox='firefox 2>/dev/null &'
alias matlab='matlab 2>/dev/null &'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

stty -ixon

alias ls="ls --color=always -F"
alias findfn="find . -iname '*php' | xargs grep -n"
alias bigfs="du -hsc * | grep [0-9][MG] | sort -n"
alias la="ls -hla"
alias ll="ls -lh"
alias sl="ls"
alias pg='ps aux | grep'  #requires an argument

#editor VIM como padrao
export EDITOR=vim

alias beep="echo $'\a' > /dev/tty1"
#alias rdesktop="rdesktop -a 16 -N -k pt-br"

#######SVN ############
#alias ci="svn ci"
#alias up="svn up"
#alias st="svn status"
#alias add="svn add"
#alias del="svn del"
#alias co="svn co"

function extract()      # Handy Extract Program.
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1     ;;
			*.tar.gz)    tar xvzf $1     ;;
			*.bz2)       bunzip2 $1      ;;
			*.rar)       unrar x $1      ;;
			*.gz)        gunzip $1       ;;
			*.tar)       tar xvf $1      ;;
			*.tbz2)      tar xvjf $1     ;;
			*.tgz)       tar xvzf $1     ;;
			*.zip)       unzip $1        ;;
			*.Z)         uncompress $1   ;;
			*.7z)        7z x $1         ;;
			*)           echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		 echo "'$1' is not a valid file"
	fi
}

