# tmux 
# -- launch tmux automatically
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# case-insensitive auto completion 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit && compinit

# aliases

alias vim='nvim'
alias ls='ls -a'
alias ssh='ssh -X'

# syntax highlighting 
# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
