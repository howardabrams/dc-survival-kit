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

function e {
    tmux new-window -a -n "emacs" "$EDITOR $@"
}

function es {
    tmux split-window "$EDITOR $@"
}

# If we have a tmux session running, attach to it, otherwise, start
# one up....oh, and let's start emacs as a daemon too.

if type tmux >/dev/null 2>&1
then
    if ps -u $USER -o fname | grep tmux >/dev/null
    then
        if [ -z "$TMUX" ]
        then
            unalias e
            tmux attach
        fi
    else
        emacs --daemon
        exec tmux
    fi
fi
