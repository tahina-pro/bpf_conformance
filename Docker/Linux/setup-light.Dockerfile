FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y libboost-dev libboost-filesystem-dev libboost-program-options-dev libelf-dev lcov cmake git pkg-config g++ sudo

# and then containers must be created with `--privileged`
