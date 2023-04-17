FROM ubuntu:jammy as linux
ARG DEBIAN_FRONTEND=noninteractive
RUN yes | unminimize
RUN apt-get update
RUN apt-get -y install vim-nox git ssh sqlite3 sudo locales curl
# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
#setup dev user
RUN useradd -ms /bin/bash -u 1002 -G sudo devuser
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/devuser
USER devuser
ENV TERM="xterm-256color"
SHELL ["/bin/bash", "--login", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
&& . ~/.nvm/nvm.sh \
&& nvm install lts/gallium
COPY vimrc .vimrc
COPY mini.vim mini.vim
