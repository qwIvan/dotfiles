[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
i() curl ip.cn/$1
alias tree="tree -C"
transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}
alias tpp="tree --prune -P"
alias c=ccat
export CHEATCOLORS=true
alias rsync-compare="rsync -ani -vv"
rsync-compare-into() rsync -aHxi -vv --progress --compare-dest=$2 $1 $3
alias t1="tree -L 1"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias t4="tree -L 4"
alias t5="tree -L 5"
alias x=extract
alias ls="ls -rhtc --color=auto"
alias l="ls -Flrahtc --color=auto"
alias -g A1="| awk \"{print \\\$1}\""
alias -g A2="| awk \"{print \\\$2}\""
alias -g A3="| awk \"{print \\\$3}\""
alias -g A4="| awk \"{print \\\$4}\""
alias -g A5="| awk \"{print \\\$5}\""
alias -g L="| less -R"
alias -g E="--help"
alias -g X="| xargs"
alias -g XI="| xargs -i"
alias -g PP="\`clippaste\`"
alias -g V="--version"
#alias -g SL="| tr ' ' '\n'"
unalias ping
alias axel="axel -a"
tcb() {
	tldr $1
	cheat $1
	bro $1
}
fiy() {
	fanyi $1
	ici $1
	yd $1
	trans $1
}
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/bin/core_perl
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:~/bin
export VISUAL="vim"
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
#bindkey "^E" autosuggest-accept
#bindkey "^F" autosuggest-accept
bindkey "^[f" forward-word
#bindkey "\`" vi-cmd-mode
eval $(thefuck --alias)

#bindkey "^M" autosuggest-execute
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
