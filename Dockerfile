FROM mhart/alpine-node:15
RUN npm install -g typescript ts-node mocha
RUN apk add --update git openssh

# Prevent "unknown host key" error when cloning private repos from Github
RUN mkdir -m 700 /root/.ssh; \
    touch -m 600 /root/.ssh/known_hosts; \
    ssh-keyscan github.com > /root/.ssh/known_hosts
