#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# TMUX
#[[ $TERM != "screen" ]] && exec tmux
# Or try one below, which is more advanced than above. only use one of two at a time
# you can also start urxvt -e tmux, I chose to use this with dwm & i3, for xface/gnome I use below one
#if which tmux 2>&1 >/dev/null; then
#    # if no session is started, start a new session
#    test -z ${TMUX} && ~/.tmuxer
#
#    # when quitting tmux, try to attach
#    while test -z ${TMUX}; do
#        tmux attach || break
#    done
#fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth #ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && eval "$(SHELL=/bin/sh lesspipe.sh)"

#PROMPT_COMMAND='CurDir=`pwd|sed -e "s!$HOME!~!"|sed -re "s!([^/])[^/]+/!\1/!g"`'
PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 30 ]; then CurDir=${DIR:0:12}...${DIR:${#DIR}-15}; else CurDir=$DIR; fi'
PS1="[\u@\h: \$CurDir] \$ "
#PS1='[\u@\h: \W]\$ '

alias ls='ls --color=auto'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'

alias cls='clear'
alias rm='rm -iv'
alias cp='cp -v'
alias mv='mv -v'

alias vi='vim'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

#export JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"
export PATH=$PATH:$HOME/libs/google_appengine
export EDITOR="vim"

#Login greeting ------------------
#if [ "$TERM" = "screen" -a ! "$SHOWED_SCREEN_MESSAGE" = "true" ]; then
#  detached_screens=`screen -list | grep Detached`
#  if [ ! -z "$detached_screens" ]; then
#    echo "+---------------------------------------+"
#    echo "| Detached screens are available:       |"
#    echo "$detached_screens"
#    echo "+---------------------------------------+"
#  else
#    echo "[ screen is activated ]"
#  fi
#  export SHOWED_SCREEN_MESSAGE="true"
#fi

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export SVN_MERGE=vimdiff

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/bin/python /usr/lib/command-not-found -- $1
                   return $?
		else
		   return 127
		fi
	}
fi
