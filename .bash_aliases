SOURCE=${BASH_SOURCE[0]:-${(%):-%x}}
if [ -n "$SOURCE" ]; then
    DIR="$( cd "$( dirname "${SOURCE}" )" >/dev/null 2>&1 && pwd )"
fi

POLLY="/opt/polly/bin/polly"
RUN_SCRIPT="${DIR}/docker_run.sh"
COMMON_ARGUMENTS="--jobs=12 --fwd HUNTER_RUN_INSTALL=ON CMAKE_EXPORT_COMPILE_COMMANDS=ON"

alias hunter-docker-build="$RUN_SCRIPT $POLLY --toolchain=gcc-7-cxx14-pic ${COMMON_ARGUMENTS} HUNTER_CONFIGURATION_TYPES=Release --config Release --verbose --clear"

alias hunter-docker-build-debug="$RUN_SCRIPT $POLLY --toolchain=gcc-7-cxx14-pic ${COMMON_ARGUMENTS} HUNTER_CONFIGURATION_TYPES=Debug --config Debug --verbose --clear"
