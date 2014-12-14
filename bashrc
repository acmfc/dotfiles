#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\D{%Y-%m-%d %H:%M:%S} \u@\h \w\n\$ '
PS1='\D{%H:%M:%S} \h \w \$ '
EDITOR=vim

alias cd..="cd .."
alias enw="emacs -nw"

function ytd () {
    [ ! -e "ytd_output" ] && youtube-dl -o ytd_output "$1" && ffmpeg -i ytd_output -vn -acodec copy "$2" && rm ytd_output
}

$HOME/inspire/inspire
