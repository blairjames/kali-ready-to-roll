FROM docker.io/kalilinux/kali-rolling:latest
RUN apt -y update && apt -y dist-upgrade && \ 
    apt -y install \
    util-linux \
    git \
    bash \
    vim \
    sslscan 
ENTRYPOINT ["/bin/bash"]
