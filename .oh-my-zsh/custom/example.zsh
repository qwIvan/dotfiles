[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
#alias lu="ls -u"
i() curl ip.cn/$1
alias xx=extract
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
alias free="free -h"
export CHEATCOLORS=true
alias rsync-compare="rsync -ani -vv"
rsync-compare-into() rsync -aHxi -vv --progress --compare-dest=$2 $1 $3
alias t1="tree -L 1"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias t4="tree -L 4"
alias t5="tree -L 5"
alias -g a1="| awk \"{print \\\$1}\""
alias -g a2="| awk \"{print \\\$2}\""
alias -g a3="| awk \"{print \\\$3}\""
alias -g a4="| awk \"{print \\\$4}\""
alias -g a5="| awk \"{print \\\$5}\""
alias -g L="| less -R"
alias -g E=" --help"
alias -g X="| xargs"
alias -g Xi="| xargs -i"
alias x=extract
alias -g PP="\`clippaste\`"
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
}
export PATH=$PATH:~/bin
TUXJDK=~/jdk-8u5-tuxjdk-b08
export STUDIO_JDK=$TUXJDK
export WEBIDE_JDK=$TUXJDK
export IDEA_JDK=$TUXJDK
export CL_JDK=$TUXJDK
export RUBYMINE_JDK=$TUXJDK
export PYCHARM_JDK=$TUXJDK
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:~/bin
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
