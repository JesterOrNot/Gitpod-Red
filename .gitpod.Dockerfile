FROM gitpod/workspace-full
USER gitpod
SHELL [ "/usr/bin/sudo", "/bin/bash", "-c" ]
RUN sudo dpkg --add-architecture i386 \
    && sudo apt-get update \
    && sudo apt-get install -y \
        libc6:i386 \
        libcurl4:i386
WORKDIR /opt/red
RUN sudo curl -s "https://static.red-lang.org/dl/auto/linux/red-latest" > red \
    && sudo chmod +x red
ENV PATH=/opt/red:$PATH
