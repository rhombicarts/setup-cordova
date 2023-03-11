FROM runmymind/docker-android-sdk:alpine-standalone

RUN apk add alpine-baselayout-3.4.0-r0 && \
    apk update && apk upgrade && \
    apk del openjdk11 && \
    apk add --force-overwrite gradle npm openjdk8 && \
    npm config set unsafe-perm true && \
    npm install -g cordova

ENV JAVA_HOME "/usr/lib/jvm/java-8-openjdk"

COPY entrypoint.sh /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
