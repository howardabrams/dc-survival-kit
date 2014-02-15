:
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH="$HOME/emacs/bin:$HOME/node/bin:$PATH"

alias ls="ls --color"
alias ll="ls --color -olhA"
alias e='emacsclient -q -a emacs'

EDITOR=emacsclient

# If we have a tmux session running, attach to it, otherwise, start
# one up.
if type tmux >/dev/null 2>&1
then
    if ps -u $USER -o fname | grep tmux >/dev/null
    then
        if [ -z "$TMUX" ]
        then
            tmux attach
        fi
    else
        exec tmux
    fi
fi
