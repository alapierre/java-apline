FROM lapierre/alpine:3

MAINTAINER Adrian Lapierre <al@alapierre.io>

RUN apk add --no-cache java-cacerts fontconfig ttf-dejavu \
    && apk --no-cache add libx11 --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing \
    && apk add --no-cache --upgrade openjdk11-jdk \
    && apk add --no-cache -u libpng --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main

ADD run-java.sh wait-for.sh /

CMD ["sh"]
