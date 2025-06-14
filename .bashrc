# ~/.bashrc - Docker Edition for Jojo 🐳✨

# Enable color in the prompt
export PS1="\[\033[01;32m\]\u@\h:\w\$\[\033[00m\] "

# Helpful aliases
alias ll='ls -lah --color=auto'
alias gs='git status'
alias ..='cd ..'
alias ...='cd ../..'

# Ollama-specific
alias orun='ollama run llama3'
alias olist='ollama list'
alias opull='ollama pull llama3'

# Enable bash completion if available
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# ~/.bashrc
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

if [ -f ~/.motd.sh ]; then
  bash ~/.motd.sh
fi