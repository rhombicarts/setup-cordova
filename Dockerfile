FROM runmymind/docker-android-sdk:ubuntu-standalone

RUN apt update -y && apt upgrade -y && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash && \
    apt-get install -f -y nodejs gradle npm && \
    node -v && \
    echo "safe-perm=true" > ~/.npmrc && \
    npm install -g cordova

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
