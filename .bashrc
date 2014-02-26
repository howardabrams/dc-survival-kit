# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions
if type tmux >/dev/null 2>&1
then
    :
else
    echo "You need to install tmux."
    sudo yum install tmux
fi

if [ -f $HOME/.profile ]
then
    . $HOME/.profile
fi
