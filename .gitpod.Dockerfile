FROM gitpod/workspace-full-vnc:latest
USER gitpod
RUN sudo dpkg --add-architecture i386 \
    && sudo apt-get update \
    && sudo apt-get install -y \
    libc6:i386 \
    libcurl4:i386
WORKDIR /opt/redlang
RUN sudo curl -s "https://static.red-lang.org/dl/auto/linux/red-latest" > red \
    && sudo chmod +x red \
    && sudo chown -hR gitpod /opt
RUN sudo bash -c "echo \"quit\" | /opt/redlang/red; \
    chown -hR gitpod /home/gitpod/.red"
ENV PATH=/opt/redlang:$PATH
