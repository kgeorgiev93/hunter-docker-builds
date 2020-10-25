ARG IMAGE
FROM ${IMAGE}
ENV DEBIAN_FRONTEND noninteractive

# additional dependencies
RUN apt-get update \
        && apt-get install --no-install-recommends -y \
        vim gdb xterm tmux netcat net-tools socat curl file wget tree ccache \
        && rm -rf /var/lib/apt/lists/*

# cmake
ARG CMAKE_VERSION=3.17.2
RUN wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-Linux-x86_64.sh \
        && chmod +x cmake-*.sh \
        && ./cmake-*.sh --prefix=/usr/local/ --skip-license \
        && rm cmake-*.sh

# ccache and hunter
ENV PATH /usr/lib/ccache:$PATH
ENV CCACHE_DIR /.ccache
ENV HUNTER_ROOT /.hunter
RUN mkdir -p $CCACHE_DIR \
        && chmod -R 777 $CCACHE_DIR \
        && mkdir -p $HUNTER_ROOT \
        && chmod -R 777 $HUNTER_ROOT
