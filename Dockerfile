FROM docker.io/kalilinux/kali-rolling:latest
RUN apt -y update && apt -y install apt-utils && apt -y full-upgrade
RUN apt -y install \
    util-linux \
    apt-utils \
    git \
    bash \
    vim \
    gobuster \
    sqlmap \
    wordlists \
    nmap \
    curl \
    wget \
    cewl \
    sslscan \
    whois \
    dnstwist \
    sqlninja \
    recon-ng \
    metasploit-framework \
    framework2

RUN gunzip /usr/share/wordlists/rockyou.txt.gz && \
    cd /usr/share/wordlists && \
    git clone https://github.com/danielmiessler/SecLists.git

RUN echo "alias l='ls -lrth'" >> /root/.bashrc && \
    echo "alias c='clear'" >> /root/.bashrc && \
    echo "alias ll='ls -lth'" >> /root/.bashrc && \
    echo "alias la='ls -larth'" >> /root/.bashrc && \
    echo "alias in='apt -y install'" >> /root/.bashrc && \
    echo "alias s='apt search'" >> /root/.bashrc && \
    echo "alias up='clear && apt clean && \
           apt-get check && \
           apt-get -y update && \
           apt-get -y full-upgrade && \
           apt autoremove -y'" >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
