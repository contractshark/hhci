FROM node:14-alpine

ENV REVIEWDOG_VERSION=v0.11.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

LABEL "com.github.actions.name"="HardHat CI Service"
LABEL "com.github.actions.description"="A GitHub Action with HardHat configured"
LABEL "com.github.actions.icon"="arrow-up"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/contractshark/hardhat-actions"
LABEL "homepage"="https://github.com/contractshark/hardhat-actions"
LABEL "maintainer"="Contract Shark CI"

RUN apk --no-cache add openssl git curl openssh-client bash jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh
COPY hardhat.sh /hardhat.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["hh --version"]
