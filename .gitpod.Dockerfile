FROM gitpod/workspace-full-vnc
USER gitpod
SHELL [ "/usr/bin/sudo", "/bin/bash", "-cl" ]
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y \
        libc6:i386 \
        libcurl4:i386
WORKDIR /opt/red
RUN curl -s "https://static.red-lang.org/dl/auto/linux/red-latest" > red \
    && chmod +x red \
    && chown -hR gitpod /opt
ENV PATH=/opt/red:$PATH
