#!/usr/bin/env bash

BUILD_IMAGE=${BUILD_IMAGE:-"ros:melodic-dev"}
POLLY="${HOME}/workspace/git/ruslo/polly"

# Create necessary folders on the host so that they are not created
# by Docker as root
mkdir -p ~/.ros ~/.ccache ~/.hunter

docker run -it --rm --init \
    -e GTEST_COLOR=1 \
    -v $POLLY:/opt/polly/ \
    -v ${HOME}/.hunter:/.hunter \
    -v ${HOME}/.ccache:/.ccache \
    -v ${HOME}/.ros:/.ros \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -u $(id -u):$(id -g) \
    ${BUILD_IMAGE} "$@"
