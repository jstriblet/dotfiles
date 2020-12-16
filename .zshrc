# tmux 
# -- launch tmux automatically
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# aliases

alias vim='nvim'
alias ls='ls -a'

# syntax highlighting 
# brew install zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
