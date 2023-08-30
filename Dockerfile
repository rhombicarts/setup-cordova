FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN apt update -y && apt upgrade -y && \
    apt-get remove -f -y nodejs && \
    apt-get remove -f -y npm && \
    apt-get remove openjdk11 && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash && \
    apt-get install -f -y nodejs gradle openjdk8 && \
    node -v && \
    echo "safe-perm=true" > ~/.npmrc && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
