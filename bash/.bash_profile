#
# ~/.bash_profile
#
#exec screen
[[ -f ~/.bashrc ]] && . ~/.bashrc

feh --bg-scale Arch.jpg &

eval "$(gpg-agent --daemon)" &  

#sh ~/.tmuxer > /dev/null # start tmux with 3 sessions 

#remove following from inittab, if you first wanted to login to console 
# kra3 being my username
#x:5:once:/bin/su - -- kra3 -l -c '/usr/bin/startx </dev/null >/dev/null 2&>1'

#function startxwithwm {
#    read -p 'gnome/xfce/dwm/(i3): '
#    case $REPLY in
#        gnome) startx gnome ;;
#        xfce) startx xfce ;;
#        dwm) startx dwm ;;
#        i3) startx i3 ;;
#        *) startx i3 ;;
#    esac
#}

## and uncomment following.
## gives an option to start X, if X is not yet started & is not an ssh connection
#if [[ -z $DISPLAY ]] && ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
#    if [ -n $SSH_CONNECTION ]; then
#        while true; do
#            read -p 'Do you want to start X? (y/n): '
#            case $REPLY in
#                [Yy])
#                    startxwithwm ;;
#                [Nn]) break ;;
#                *) printf '%s\n' 'Please answer y or n.' ;;
#            esac
#        done
#    fi
#fi
