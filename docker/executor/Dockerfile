FROM java:8-jre-alpine

RUN apk update
RUN apk add curl
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-0.9.12"
RUN chmod +x /usr/local/bin/digdag

ENTRYPOINT /usr/local/bin/digdag server \
           --config postgresql.properties \
           --max-task-threads 5

COPY postgresql.properties postgresql.properties
