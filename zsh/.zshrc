# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

if [ "$XDG_SESSION_DESKTOP" = "wayland" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

export _JAVA_AWT_WM_NONREPARENTING=1
export MANPAGER='nvim +Man!'
export PATH=$PATH:/usr/sbin

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vim="nvim"
alias c="clear"
alias tmx='tmux new -s $(basename $PWD)'
alias ls='exa --icons'
alias cat='bat'
alias sd='sudo shutdown now'
alias update='~/scripts/update'
alias sk='~/scripts/screenkey'
alias python='python3'
alias draw="~/Documents/Lorien_v0.6.0_Linux/Lorien.x86_64"

bindkey -s ^f "~/scripts/tmux-se\n"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/pedro/.local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local:$PATH

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export _JAVA_AWT_WM_NONREPARENTING=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/pedro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Pomodoro
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro
# and lolcat - sudo apt install lolcat

declare -A pomo_options
pomo_options["work"]="120"
pomo_options["break"]="15"

pomodoro () {
  if [ -n "$1" ] && [ -n "${pomo_options["$1"]}" ]; then
    val=$1
    # Use second argument if provided, otherwise fallback to default from array
    duration=${2:-${pomo_options["$val"]}}

    echo "$val for $duration minutes" | lolcat
    timer "${duration}m"
    spd-say "'$val' session done"
    notify-send -u normal -i alarm-symbolic "Pomodoro" "'$val' Session done!"
  else
    echo "Usage: pomodoro [work|break] [optional duration]" | lolcat
  fi
}

# alias wo="pomodoro work"
# alias br="pomodoro break"
alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

# # ASCII welcome message
# center() {
#   term_width=$(tput cols)
#   while IFS= read -r line; do
#     printf "%*s\n" $(( (${#line} + term_width) / 2 )) "$line"
#   done
# }
#
# clear
# figlet "Pedro" |center |  lolcat
# figlet "(¬_¬)" |center |  lolcat
# # echo
# # center <<< "Stay focused and crush your goals 💪"



# Load Angular CLI autocompletion.
source <(ng completion script)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/pedro/.lmstudio/bin"
# End of LM Studio CLI section

