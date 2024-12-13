# Starship
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python version manager
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom aliases
alias db="cd ~/Developer/DataBeacon/"
alias p="cd ~/Developer/Personal/"
alias a="cd ~/Developer/DataBeacon/analytics/"
alias s="cd ~/Developer/DataBeacon/simplifid/"
alias ss="cd ~/Developer/DataBeacon/simplifid-scenarios/"
alias vim="nvim"
alias awslogin="aws sso login --sso-session Databeacon"
alias ls="eza"
alias zbr="zig build run"

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

# rancher (docker) cli 
export RANCHER_HOME="$HOME/.rd";
export PATH="$RANCHER_HOME/bin:$PATH";

# Cargo installs
. "$HOME/.cargo/env"

# haskell toolchain
[ -f "/Users/charliebacon/.ghcup/env" ] && . "/Users/charliebacon/.ghcup/env" # ghcup-env

# pnpm
export PNPM_HOME="/Users/charliebacon/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Zoxide
eval "$(zoxide init zsh)"

# The F*ck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Fzf
source <(fzf --zsh)

#Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Created by `pipx` on 2024-11-30 09:38:46
export PATH="$PATH:/Users/charliebacon/.local/bin"

export PATH="$PATH:/Users/charliebacon/.local/share/mise/shims"
