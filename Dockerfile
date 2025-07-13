FROM koreader/kokindle:0.4.1-22.04

USER root
RUN apt-get -qq update -y && apt-get -qq upgrade -y && \
    apt-get -qq install -y build-essential autoconf automake bison flex gawk \
    libtool libtool-bin libncurses-dev curl file git gperf help2man texinfo \
    unzip wget libarchive-dev nettle-dev patchelf && \
    apt-get -qq clean -y && apt-get -qq autoremove -y

COPY x-tools/ /usr/local/x-tools/

USER ko
