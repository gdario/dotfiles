export PATH="$HOME/.local/bin:/usr/local/bin:${PATH}"
alias ls='ls -G'
export EDITOR="emacsclient -t"
export VISUAL="emacsclient -c -a emacs"
export ALTERNATE_EDITOR=""
alias em="emacsclient -t"

# Set the language and locale for R
export LANGUAGE="en"
export LC_ALL="en_US.UTF-8"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dariog/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dariog/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dariog/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dariog/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

