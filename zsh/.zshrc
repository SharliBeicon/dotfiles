# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python version manager
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PATH"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Custom aliases
alias db="cd ~/Documents/DataBeacon/"
alias p="cd ~/Documents/Personal/"
alias a="cd ~/Documents/DataBeacon/analytics/"
alias s="cd ~/Documents/DataBeacon/simplifid/"
alias ss="cd ~/Documents/DataBeacon/simplifid-scenarios/"
alias vim="nvim"
alias awslogin="aws sso login --sso-session Databeacon"
alias ls="eza"

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

# rancher (docker) cli 
export RANCHER_HOME="$HOME/.rd";
export PATH="$RANCHER_HOME/bin:$PATH";

. "$HOME/.cargo/env"

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
eval "$(~/.local/bin/mise activate zsh)"
