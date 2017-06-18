FROM java:8-jre-alpine

RUN apk update
RUN apk add curl
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-0.9.12"
RUN chmod +x /usr/local/bin/digdag

ENTRYPOINT /usr/local/bin/digdag server \
           -b 0.0.0.0 \
           --config postgresql.properties \
           --disable-local-agent \
           --disable-executor-loop

COPY postgresql.properties postgresql.properties
