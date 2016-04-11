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
alias cat=ccat
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
