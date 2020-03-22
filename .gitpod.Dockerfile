FROM gitpod/workspace-full-vnc:latest
USER gitpod
RUN sudo dpkg --add-architecture i386 \
    && sudo apt-get update \
    && sudo apt-get install -y \
    libc6:i386 \
    libcurl4:i386
WORKDIR /opt/redlang
RUN sudo bash -c "curl -s "https://static.red-lang.org/dl/auto/linux/red-latest" > red \
    && sudo chmod +x red \
    && echo \"quit\" | /opt/redlang/red; \
    && sudo chown -hR gitpod /opt /home/gitpod/.red"
ENV PATH=/opt/redlang:$PATH
