FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y libboost-dev libboost-filesystem-dev libboost-program-options-dev libelf-dev lcov cmake git pkg-config g++ sudo

ENV HOME /root

ADD . $HOME/bpf-conformance
WORKDIR $HOME/bpf-conformance
RUN git submodule init && git submodule update

# and then containers must be created with `--privileged`
