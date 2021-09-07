export NODE_PATH=~/.config/yarn/global/node_modules
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.yarn/bin:$PATH
export PATH=$PATH:/usr/bin/core_perl
export PATH=$PATH:/usr/bin/vendor_perl/
export PATH=$PATH:/usr/lib/w3m/
export PATH=$PATH:/usr/share/bcc/tools/
for bin in ~/.gem/ruby/*/bin; do
    export PATH=$PATH:$bin
done
export QT_QPA_PLATFORMTHEME=gtk2
systemctl --user import-environment DISPLAY
eval `ssh-agent -s`
ssh-add
xrdb -merge ~/.Xresources
fildem &
XDG_SESSION_TYPE=x11 GDK_BACKEND=x11 exec gnome-session
