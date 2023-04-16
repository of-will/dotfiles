source ~/.bashrc
alias zshrc='vim ~/.zshrc'
PROMPT='%1~ $ '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LDFLAGS="-L/opt/homebrew/opt/freetds/lib -L/opt/homebrew/opt/openssl@3/lib"
export CFLAGS="-I/opt/homebrew/opt/freetds/include"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
