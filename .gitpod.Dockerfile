FROM gitpod/workspace-full-vnc:latest
USER gitpod
SHELL [ "/usr/bin/sudo", "/bin/bash", "-cl" ]
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y \
        libc6:i386 \
        libcurl4:i386
WORKDIR /opt/redlang
RUN curl -s "https://static.red-lang.org/dl/auto/linux/red-latest" > red \
    && chmod +x red \
    && chown -hR gitpod /opt
RUN echo "quit" | /opt/redlang/red
ENV PATH=/opt/redlang:$PATH
