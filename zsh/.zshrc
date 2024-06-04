# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim="nvim"
alias c="clear"
alias todo= 'go run ~/Documents/personal/go-todo/main.go'
alias tmx='tmux new -s $(basename $PWD)'
# alias files='fzf --preview "bat --style=numbers --color=always {} | head -500"'
alias combine='~/scripts/combine'
alias dnotes='~/DeepNotes-1.0.24.AppImage'
alias ls='exa --icons'
alias cat='batcat'


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/pedro/.local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH


. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

