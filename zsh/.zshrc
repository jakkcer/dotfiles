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

# nodebrew path
export PATH="$HOME/.nodebrew/current/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

alias chrome="open -a 'Google Chrome'"

# jdk version
export JAVA_HOME=`/usr/libexec/java_home -v "11"`
export PATH="$JAVA_HOME/bin:$PATH"
