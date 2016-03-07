# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export ANDROID_SDK_HOME=~/android-sdk-linux
export JAVA_HOME=~/jdk1.8.0_51
export PATH=$PATH:$ANDROID_SDK_HOME/ndk-bundle:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools:$JAVA_HOME/bin
TUXJDK=~/jdk-8u5-tuxjdk-b08
export STUDIO_JDK=$TUXJDK
export WEBIDE_JDK=$TUXJDK
export IDEA_JDK=$TUXJDK
export CL_JDK=$TUXJDK
export RUBYMINE_JDK=$TUXJDK
export PYCHARM_JDK=$TUXJDK

export M2_HOME=~/apache-maven-3.3.9
export PATH="$PATH:$M2_HOME/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
~/adbyby/adbyby &
sh ~/shadowiptables.sh && \
~/chinadns-1.3.2/src/chinadns -c ~/chnroute.txt -m -p 8384 -s 45.127.93.239:5354,114.114.114.114 &
