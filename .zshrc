[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="jonathan"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git adb history mvn npm pip web-search extract d gradle meteor systemadmin colored-man-pages history-substring-search sprunge httpie urltools common-aliases themes gem github singlechar battery colorize screen archlinux rsync gulp fasd safe-paste vi-mode tmux alias-tips python sbt coffee compleat dircycle dirpersist docker encode64 pep8 pylint rails redis-cli ruby rvm scala sublime sudo supervisor systemd vagrant virtualenv cabal docker-compose django bower nmap gnu-utils fancy-ctrl-z postgres zsh-navigation-tools)# per-directory-history zsh-autosuggestions)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source ~/alias-tips/alias-tips.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
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
alias axel="axel -a"
alias e=vim
alias pacql="pacman -Ql"
alias plunt="sudo netstat -plunt"
alias -g A1="| awk \"{print \\\$1}\""
alias -g A2="| awk \"{print \\\$2}\""
alias -g A3="| awk \"{print \\\$3}\""
alias -g A4="| awk \"{print \\\$4}\""
alias -g A5="| awk \"{print \\\$5}\""
alias -g L="| less -R"
alias -g X="| xargs"
alias -g XI="| xargs -i"
alias -g PP="\`clippaste\`"
alias -g V="--version"
alias -g SL="| tr ' ' '\n'"
alias -g G="| grep -iP"
unalias ping
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
export PATH=$PATH:/home/ivan/.gem/ruby/2.3.0/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$PATH:/usr/bin/vendor_perl/
export VISUAL="vim"
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down
#bindkey "^F" autosuggest-accept
#bindkey "^M" autosuggest-execute
bindkey "^[f" forward-word
#bindkey '`' vi-cmd-mode
eval $(thefuck --alias)

ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export DEBFULLNAME="Ivan Wu"
export DEBEMAIL="wuyifan@deepin.com"
