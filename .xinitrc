export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
TUXJDK=/usr/lib/jvm/java-8-tuxjdk
export STUDIO_JDK=$TUXJDK
export WEBIDE_JDK=$TUXJDK
export IDEA_JDK=$TUXJDK
export RUBYMINE_JDK=$TUXJDK
export PYCHARM_JDK=$TUXJDK
export GOPATH=~/go
export PATH=$TUXJDK/bin:$PATH
QT_QPA_PLATFORMTHEME=gtk2
systemctl --user import-environment DISPLAY
exec i3
