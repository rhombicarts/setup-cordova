FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN apt update && apt upgrade && \
    apt-get install gradle npm && \
    echo "safe-perm=true" > ~/.npmrc && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
