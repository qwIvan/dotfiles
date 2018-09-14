export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.yarn/bin:$PATH
export PATH=$PATH:/usr/bin/core_perl
export PATH=$PATH:/usr/bin/vendor_perl/
export PATH=$PATH:/usr/lib/w3m/
export PATH=$PATH:/usr/share/bcc/tools/
QT_QPA_PLATFORMTHEME=gtk2
systemctl --user import-environment DISPLAY
eval `ssh-agent -s`
ssh-add
exec i3
