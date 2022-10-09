FROM archlinux:latest
RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S npm
RUN pacman --noconfirm -S python python-pip
RUN pacman --noconfirm -S rustup
RUN pacman --noconfirm -S dotnet-sdk
RUN pacman --noconfirm -S gcc
RUN pacman --noconfirm -S jdk-openjdk
RUN pacman --noconfirm -S r
RUN pacman --noconfirm -S kotlin
RUN pacman --noconfirm -S go
RUN pacman --noconfirm -S php
RUN pacman --noconfirm -S ruby
RUN pacman --noconfirm -S nim
RUN pacman --noconfirm -S r
RUN pacman --noconfirm -S ffmpeg
RUN pacman --noconfirm -S rpm
RUN pacman --noconfirm -S nano vim neovim
RUN pacman --noconfirm -S jq
RUN pacman --noconfirm -S openssh
RUN echo 'CODERV="$(curl https://api.github.com/repos/coder/code-server/releases/latest  -s | jq .name -r | sed -e s/v//g)"' > /install.sh
RUN echo 'echo Done: get v${CODERV}' >> /install.sh
RUN echo 'rpm -i https://github.com/coder/code-server/releases/download/v${CODERV}/code-server-${CODERV}-amd64.rpm' >> /install.sh
RUN echo 'echo Done: Install' >> /install.sh
RUN echo 'mkdir -p /tmp/code-server' >> /install.sh
RUN echo 'cat <<EOF > /tmp/code-server/config.yaml' >> /install.sh
RUN echo 'bind-addr: 0.0.0.0:8080' >> /install.sh
RUN echo 'auth: password' >> /install.sh
RUN echo 'password: PaSsW0rD' >> /install.sh
RUN echo 'cert: false' >> /install.sh
RUN echo 'EOF' >> /install.sh
RUN echo 'echo Done: Configuration' >> /install.sh
RUN echo 'pacman --noconfirm -Syyu' >> /install.sh
RUN echo 'npm i -g n npm' >> /install.sh
RUN echo 'n latest' >> /install.sh
RUN echo 'rustup default stable' >> /install.sh
RUN echo 'rustup component add rls rust-analysis rust-src' >> /install.sh
RUN echo 'echo Done: update' >> /install.sh
RUN echo 'code-server --config /tmp/code-server/config.yaml' >> /install.sh
RUN chmod 755 /install.sh
CMD bash -c "/install.sh"
