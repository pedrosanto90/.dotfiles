# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

if [ "$XDG_SESSION_DESKTOP" = "wayland" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

export _JAVA_AWT_WM_NONREPARENTING=1

export GOBIN="$HOME/.asdf/shims"

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
alias sd='sudo shutdown now'

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/pedro/.local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local:$PATH

. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
