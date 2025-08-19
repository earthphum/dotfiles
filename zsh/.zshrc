# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme (use powerlevel10k if installed)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins for programmers
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  vscode
  npm
  node
  yarn
  sudo
  history
  autojump
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Enable command correction
ENABLE_CORRECTION="true"

# Case insensitive completion
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# History settings: big history, shared between sessions
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY       # Append to history file immediately
setopt SHARE_HISTORY            # Share history between all sessions
setopt HIST_IGNORE_DUPS         # Ignore duplicate entries
setopt HIST_REDUCE_BLANKS       # Remove blank entries
setopt HIST_VERIFY              # Show command before execution on history recall

# Aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias v='nvim'
alias code='vsc'
alias c='clear'
alias yad='yad'
# Set PATH for local bin and user bin
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# Editor preferences
export EDITOR='nvim'

# Load autojump if installed
[[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# Enable syntax highlighting and autosuggestions plugins (if not loaded automatically)
# They are loaded by Oh My Zsh plugin system but sometimes need manual source:
# source ${(q-)ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ${(q-)ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# If you want, add some environment variables here for programming languages:
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin

# Other personal environment variables:
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Powerlevel10k config will prompt you at first run; you can edit it later in ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# เปิด pyenv commands (init สำหรับ shims & autocompletion)
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi


export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
