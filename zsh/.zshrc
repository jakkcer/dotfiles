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

# PATH setting
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH

# go path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# alias setting
alias chrome="open -a 'Google Chrome'"
alias sshc="sh ~/.dotfiles/ssh_change_profile.sh"

# Auto added scripts
# ------------------------------------
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rls01041917/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rls01041917/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rls01041917/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rls01041917/google-cloud-sdk/completion.zsh.inc'; fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
