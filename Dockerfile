FROM python:alpine

ENV SAM_CLI_TELEMETRY 0

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add --no-cache --virtual build-deps build-base gcc && \
    pip install aws-sam-cli && \
    apk del build-deps

WORKDIR /var/opt

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/sam"]
