EDITOR=nvim

alias re="exec ${SHELL} -l"

alias rc="$EDITOR ~/.bashrc"
alias vrc="$EDITOR ~/.vimrc"
alias nvrc="$EDITOR ~/.config/nvim/init.vim"

export CLICOLOR=1

if [ -x "$(command -v exa)" ]; then
  alias exa-options='exa -all --group-directories-first --time-style long-iso --group --ignore-glob=".DS_Store" --git'
  alias l='exa-options --oneline --icons'
  alias ll='exa-options --long'
  alias lt='exa-options --tree --git-ignore --ignore-glob=".git"'
else
  eval `gdircolors ~/.dircolors`
  alias l='gls -1 --color --group-directories-first'
  alias ll='gls -lah --color --group-directories-first'
  alias lt='tree -L 2 -a'
fi

alias ..='cd ..;ll'
alias ~='cd ~;ll' 
alias -- -='cd -;ll'
export CDPATH=""
export CDPATH="$CDPATH:$HOME"
export CDPATH="$CDPATH:$HOME/Documents"
export CDPATH="$CDPATH:$HOME/Documents/Projects"

c() {
	export CDPATH=$CDPATH

	if [ $# -eq 0 ]; then
	    ls $(echo $CDPATH | tr ":" "\n")
	else
		if [[ -f $1 ]]; then
		    bat -p "$1"
		else
		    cd "$1"
		    ll
		fi
	fi
}

alias f="fzf \
	--preview 'bat --style=numbers --color=always --line-range :500 {}' \
	--bind 'ctrl-e:execute($EDITOR {})+abort' \
	--bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
	--bind 'enter:execute(clear; bat --paging=always {}; clear)' \
	--bind 'ctrl-o:execute(open {})+abort'"
alias f='/Users/Will/Documents/Projects/config/fzf/rfv.sh'

alias t='task'

alias utc='gdate --utc'

# hf 
source ~/.hf_aliases

# In zsh, you can use glob qualifiers to match files by type. The . qualifier matches regular files; use ^/ to match all non-directories, or -^/ to also exclude symbolic links to directories.
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers
alias mvfiles="mv -- *(.)"

alias diff=colordiff

# ssh
alias scpid='ssh-copy-id -i ~/.ssh/id_rsa.pub'
alias sshconfig="$EDITOR ~/.ssh/config"
alias s='ssh'
sst() {	 # ssh then tmux attach
    echo -ne "\033]0;"$*"\007"
    /usr/bin/ssh -t $@ "tmux attach -d || tmux -2 new";
}

# python #
alias py='export PYTHONBREAKPOINT=ipdb.set_trace; source $(pwd)/.venv/bin/activate'
alias pyvenv='python3 -m venv venv; source venv/bin/activate; python -m pip install --upgrade pip; python -m pip install pip-tools; touch requirements.in'
alias pipt='pip-compile; pip-sync'

# macos #
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

alias make=gmake

alias rmtz="defaults delete com.apple.iCal 'RecentlyUsedTimeZones'"

alias cplast='fc -ln -1 | pbcopy'
alias pbc='pbcopy'
alias pbp='pbpaste'

alias pjson="pbpaste | jq '.' | pbcopy"

alias rmds="find . -name \*.DS_Store -type f -delete -print"
alias rmrds="find . -type f -name '\*.DS_Store' -ls -delete -print"

dark() {
    osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode';
}

alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

alias showdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

alias trim='pbpaste | tr -d " " | pbcopy'

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Merge PDF files, preserving hyperlinks
# Usage: `mergepdf input{1,2,3}.pdf`
alias mergepdf='gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=_merged.pdf'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
