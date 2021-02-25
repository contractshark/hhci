FROM node:14-alpine

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

ENTRYPOINT ["/entrypoint.sh"]
CMD ["hh --version"]
