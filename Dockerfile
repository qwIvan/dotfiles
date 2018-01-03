FROM archlinux/base
RUN sed -i /\\[multilib\\]/,+1s/#// /etc/pacman.conf
RUN echo -e '[archlinuxcn]\nServer = http://mirrors.163.com/archlinux-cn/$arch' >> /etc/pacman.conf
RUN pacman-key --init
ADD package_list .
RUN pacman -Sy --noconfirm grep gettext archlinuxcn-keyring && \
      bash -c "comm -23 <(comm -12 <(sort package_list) <(pacman -Slq | sort)) <(pactree -sru xproto | sort) > /tmp/tmplist && \
      comm -23 /tmp/tmplist <(pacman -Fyl - < /tmp/tmplist | grep 'usr/share/applications/.*\.desktop$' | cut -d \  -f 1 | uniq) > /tmp/has-desktop && \
      comm -23 /tmp/has-desktop <(LANGUAGE=en_US.UTF-8 pacman -Si - < /tmp/has-desktop | grep '^Name\|^Installed Size.*MiB$' | grep -B 1 '^Installed Size.*MiB$' | grep -v '\-\-' | tr '\n' '\t' | xargs -n 8 echo | awk '{print \$7,\$3}' | cat - <(echo 32) | sort -h | sed '1,/^32$/d' | cut -d \  -f 2 | sort) | pacman -S --needed --noconfirm -" && \
      rm -rf /var/cache/pacman/pkg/* package_list /tmp/tmplist
#RUN bash -c "pip install -r <(cut -d = -f 1 pip_package_list) --user"
ADD .zshrc /root/
ADD .base.vimrc /root/
ADD .vimrc /root/
