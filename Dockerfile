FROM archlinux/base
RUN sed -i /\\[multilib\\]/,+1s/#// /etc/pacman.conf
RUN echo -e '[archlinuxcn]\nServer = http://mirrors.163.com/archlinux-cn/$arch' >> /etc/pacman.conf
RUN pacman-key --init
#RUN pacman -Sy --noconfirm grep gettext archlinuxcn-keyring
ADD package_list .
RUN pacman -Sy --noconfirm grep gettext archlinuxcn-keyring && \
      bash -c "comm -23 <(comm -12 <(sort package_list) <(pacman -Slq | sort)) <(pactree -sru xproto | sort) | pacman -S --needed --noconfirm -" && \
#RUN bash -c "comm -23 <(comm -12 <(sort package_list) <(pacman -Slq | sort)) <(pactree -sru xproto | sort) | pacman -S --needed --noconfirm -" && \
      rm -rf /var/cache/pacman/pkg/*
#ADD pip_package_list .
#RUN bash -c "pip install -r <(cut -d = -f 1 pip_package_list) --user"
