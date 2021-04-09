if [ ! -f $HOME/.local/bin/s9y ]; then
    cp $(dirname ${BASH_SOURCE:-$0})/s9y $HOME/.local/bin/
fi
