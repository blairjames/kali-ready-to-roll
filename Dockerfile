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
  console-setup

# Set local timezone
ENV TZ=Australia/Brisbane

# Perform installation of all Kali packages
RUN \
  apt -y install kali-linux-headless

# Install wordlists 
RUN \
  apt -y install seclists

# Extract rockyou.txt and remove archive
RUN \
  /usr/bin/gunzip /usr/share/wordlists/rockyou.txt.gz \
  && /usr/bin/rm -f /usr/share/wordlists/rockyou.txt.gz
  
# Final confirmation that packages are up to date
RUN \
  apt -y update \
  && apt -y upgrade \
  && apt autoremove

USER root
ENTRYPOINT ["/bin/bash"]
