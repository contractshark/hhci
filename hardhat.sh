#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

if [[ ! -d "${HOME}/.hardhat" ]]; then
	mkdir -p "${HOME}/.hardhat"
	chown -R ${UID}:$(id -g ${UID}) "${HOME}/.hardhat"
fi

DOCKER_ARGS=""

# I/O Detection for TTY
# This allows use in subshells without CRLF line-endings from TTY.
if [ -t 0 ] && [ -t 1 ]; then
	DOCKER_ARGS+=" -t"
fi

# TTY Detection for Interactivity
# This allows input in all but non-interactive shells.
if tty -s; then
	DOCKER_ARGS+=" -i"
fi

# HARDHAT Environment Variables
# Pass through all HARDHAT variables, including session tokens and role assumption.
while read line; do
	DOCKER_ARGS+=" -e ${line}"
done < <(env | grep "HARDHAT_")

docker run --rm \
	${DOCKER_ARGS} \
	-v "$(pwd):/project" \
	-v "${HOME}/.hardhat:/root/.hardhat" \
	contractshark/hardhat-cli \
	"$@"
