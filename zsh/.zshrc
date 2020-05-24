#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# export PATH="/anaconda3/bin:$PATH"  # commented out by conda initialize

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias ssh='~/.dotfiles/ssh_change_profile.sh'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakkcer/Tool/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jakkcer/Tool/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakkcer/Tool/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jakkcer/Tool/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

