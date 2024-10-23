# Enable Powerlevel10k instant prompt
# Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
autoload -Uz promptinit
promptinit
# Use the Powerlevel10k prompt
source ~/powerlevel10k/powerlevel10k.zsh-theme || { echo "Powerlevel10k theme not found!"; exit 1; }

# Keep 1000 lines of history and save it to ~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt histignorealldups sharehistory

# Use emacs keybindings
bindkey -e

# History substring search keybindings
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# Use modern completion system
autoload -Uz compinit
compinit

# Completion styles
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Set colors and prompts for completion
eval "$(dircolors -b)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Load plugins
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh || echo "Zsh Autosuggestions not found!"
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || echo "Zsh Syntax Highlighting not found!"
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh || echo "Zsh History Substring Search not found!"
source <(kubectl completion zsh)

# Load custom Powerlevel10k config if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Environment variables and aliases
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
alias k="kubectl"
alias ls="exa --icons"
alias bat="bat --style=auto"


