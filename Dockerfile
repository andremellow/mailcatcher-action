FROM dockage/alpine:3.5

ENV MAILCATCHER_VERSION=0.7.1

RUN apk update \
    && apk --no-cache add g++ make ruby2.2 ruby2.2-dev ruby2.2-json sqlite-dev \
    && gem2.2 install mailcatcher:${MAILCATCHER_VERSION} --no-ri --no-rdoc \
    && apk del g++ make \
    && rm -rf /var/cache/apk/*

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "-f"]
CMD ["--ip", "0.0.0.0"]