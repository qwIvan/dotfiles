export ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="ys"
DISABLE_AUTO_UPDATE="true"
plugins=(fasd git adb history mvn npm pip web-search extract gradle meteor systemadmin colored-man-pages history-substring-search sprunge httpie urltools common-aliases themes gem github singlechar battery colorize screen archlinux rsync gulp safe-paste vi-mode tmux python sbt coffee compleat dircycle dirpersist docker encode64 pep8 pylint redis-cli scala sublime sudo supervisor systemd vagrant virtualenv cabal docker-compose django bower nmap gnu-utils fancy-ctrl-z postgres zsh-navigation-tools globalias kubectl helm)
# ruby rvm per-directory-history rails)

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source /usr/share/pinyin-completion/shell/pinyin-comp.zsh
source $ZSH/oh-my-zsh.sh
for z in `ls /usr/share/zsh/plugins/*/*.plugin.zsh`;do
  source $z
done
i () curl ip.cn/$1
alias sudo="sudo -E "
lf () {
  # echo -n '"'
  test -z $@ || echo -n $@/
  ls -t $@ | head -n 1 | tr -d '\n'
  # echo '"'
}
export LESS="-RFXeKi"
le () {
  unbuffer $@ | less
}
pkg () {
	pacman -Si $1 2> /dev/null | head -n 1 | grep -Po '(?<=:\s).*' | xargs -i google-chrome-stable https://www.archlinux.org/packages/{}/x86_64/$1/ | xargs test || google-chrome-stable https://aur.archlinux.org/packages/$1 > /dev/null
}
loop () {
  while true
  do
    $@
    sleep 1
  done
}
vv () {
    rgv | sed -n $1P | sed 's/^\s*[0-9]*\s*//g' | awk -F '[:]' '{printf "pycharm --line %s \"%s\"", $2, $1}' | sh
}
alias c=/bin/bat
alias pareps="le pacaur -Ss"
alias tpp="tree --prune -P"
export CHEATCOLORS=true
alias rsync-compare="rsync -ani -vv"
rsync-compare-into() rsync -aHxi -vv --progress --compare-dest=$2 $1 $3
alias x=extract
alias ls="ls -rhtc --color=auto"
alias l="ls -Flrahtc --color=auto"
alias axel="axel -a"
alias pacfl="pacman -Ql"
alias pacown="pacman -Qo"
alias plunt="sudo netstat -plunt"
alias pain="pacaur -S --noedit"
alias rm=trash
alias sumi="awk '{s+=\$1} END {print s}'"
alias ips="sudo iptables -t"
alias ipsm="sudo iptables -t mangle -L -n --line-numbers"
alias ipsn="sudo iptables -t nat -L -n --line-numbers"
alias chrome=google-chrome-stable
alias open=xdg-open
alias history="fc -i -l 1"
alias sc-="sudo systemctl"
alias subvolume="btrfs subvolume"
alias -g A1="| awk \"{print \\\$1}\""
alias -g A2="| awk \"{print \\\$2}\""
alias -g A3="| awk \"{print \\\$3}\""
alias -g A4="| awk \"{print \\\$4}\""
alias -g A5="| awk \"{print \\\$5}\""
alias -g L="| less -R"
alias -g X="| xargs"
alias -g XI="| xargs -i"
alias -g V="--version"
alias -g SL="| tr ' ' '\n'"
alias -g G="| grep -iP"

unalias ping
unalias gm

export EDITOR="vim"
export PYTHONSTARTUP=~/.pythonstartup.py
export GPG_TTY=$(tty)
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
bindkey "^F" forward-word
bindkey "^K" autosuggest-execute
bindkey "^T" fasd-complete
#eval $(thefuck --alias)  # so slow!!

ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_OPTS="--exact"

autoload -U +X bashcompinit
bashcompinit
export MAKEFLAGS="-j12"
export XZ_DEFAULTS="--threads 0"

# https://github.com/zsh-users/zsh-syntax-highlighting/issues/295
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
