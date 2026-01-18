# =====================================================
#  Powerlevel10k Instant Prompt
# =====================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====================================================
#  Environment & PATH
# =====================================================
export EDITOR="nvim"
export VISUAL="nvim"
export QT_QPA_PLATFORM="xcb"
export SUDO_EDITOR="nvim"
# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# ปิด wizard p10k
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Truecolor support
export COLORTERM="truecolor"

# TERM detection
if [[ "$TERM_PROGRAM" == "kitty" ]]; then
  export TERM="xterm-kitty"
fi

export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
# =====================================================
#  Oh-My-Zsh
# =====================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

# เปิดระบบ completion
autoload -Uz compinit
compinit


# =====================================================
#  Autosuggestions
# =====================================================

source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555"




# =====================================================
#  fzf
# =====================================================
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh


# =====================================================
#  zoxide (cd ที่เร็วกว่า 100 เท่า)
# =====================================================
eval "$(zoxide init zsh)"


# =====================================================
#  fast-syntax-highlighting (ต้องล่างสุดของ plugins)
# =====================================================
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh



# =====================================================
#  History
# =====================================================
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt hist_verify


# =====================================================
#  Aliases
# =====================================================
alias ll="ls -lah"
alias la="ls -A"
alias l="ls -CF"
alias c="clear"
alias ca="cat"
alias vim="nvim"
alias v="nvim"
alias zed="zeditor"
alias em="cd ~/earth/myproject/"
alias ew="cd ~/earth/wetrust/"
alias rm="trash"
alias fm="yazi" # file manager
alias sv="sudoedit"
# ถ้าติดตั้ง bat
command -v bat &> /dev/null && alias b="bat"


# =====================================================
#  Local override
# =====================================================
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


# =====================================================
#  Load Powerlevel10k config
# =====================================================
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# bun completions
[ -s "/home/retsam/.bun/_bun" ] && source "/home/retsam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
