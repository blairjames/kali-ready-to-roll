FROM kalilinux/kali-rolling

# Update repos and install tools needed to complete build successfully. 
RUN \
  apt -y update \
  && DEBIAN_FRONTEND='noninteractive' \
  apt -y install --no-install-recommends \
  apt-utils \
  apt-transport-https \
  ca-certificates \
  libllvm15 \
  tzdata \
  console-setup \
  webscarab

# Set local timezone
ENV TZ=Australia/Brisbane

# Perform installation of all Kali packages
RUN \
  DEBIAN_FRONTEND='noninteractive' \ 
    apt -y install --no-install-recommends kali-linux-headless

# Install wordlists 
RUN \
  DEBIAN_FRONTEND='noninteractive' \ 
    apt -y install --no-install-recommends seclists

# Extract rockyou.txt and remove archive
RUN \
  gunzip /usr/share/wordlists/rockyou.txt.gz
  
# Final confirmation that packages are up to date
RUN \
  apt -y update \
  && DEBIAN_FRONTEND='noninteractive' apt -y upgrade \
  && DEBIAN_FRONTEND='noninteractive' apt autoremove

USER root
ENTRYPOINT ["/bin/bash"]

USER root
ENTRYPOINT ["/bin/bash"]
