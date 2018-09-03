export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export GOPATH=~/go
export PATH=~/.local/bin:$PATH
QT_QPA_PLATFORMTHEME=gtk2
systemctl --user import-environment DISPLAY
eval `ssh-agent -s`
ssh-add
exec i3
