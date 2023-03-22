FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN apt update -y && apt upgrade -y && \
    apt-get install -y nodejs gradle npm && \
    node -v && \
    echo "safe-perm=true" > ~/.npmrc && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
