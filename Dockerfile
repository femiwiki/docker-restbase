FROM node:10-alpine

ARG NODE_ENV=production
# Environment variables used by RESTBase
ENV APP_CONFIG_PATH=/srv/restbase/config.yaml
ENV APP_BASE_PATH=/srv/restbase/node_modules/restbase

#
# Healthcheck
#
RUN apk add --no-cache curl
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://localhost:7231/ || exit 1

#
# Install restbase and its build dependencies
#
WORKDIR /srv/restbase
RUN apk add --no-cache --virtual .build-deps \
    git python make g++
COPY package.json ./
RUN yarn

# Remove build dependencies
RUN apk del .build-deps

#
# Config
#
COPY config.yaml ./
EXPOSE 7231

COPY run /usr/local/bin/
CMD /usr/local/bin/run &&\
    node $APP_BASE_PATH/server.js
