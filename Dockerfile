FROM kalilinux/kali-rolling

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

ENV TZ=Australia/Brisbane

RUN \
  apt -y install kali-linux-headless

RUN \
  apt -y install seclists

RUN \
  apt -y update && apt -y upgrade

USER root
ENTRYPOINT ["/bin/bash"]
