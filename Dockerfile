FROM node:10-alpine

#
# Healthcheck
#
RUN apk add --no-cache curl
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD curl -f http://localhost:7231/ || exit 1

#
# Install restbase
#
ARG RESTBASE_VERSION=0.19.2
ADD https://github.com/wikimedia/restbase/archive/v${RESTBASE_VERSION}.tar.gz /tmp/a.tar.gz
RUN tar -xf /tmp/a.tar.gz -C /tmp/ &&\
    rm /tmp/a.tar.gz &&\
    mv /tmp/restbase-${RESTBASE_VERSION} /srv/restbase
WORKDIR /srv/restbase

# Install dependencies of restbase
RUN apk add --no-cache --virtual \
    git python
RUN npm install

#
# Config
#
COPY config.yaml .
EXPOSE 7231
CMD sed -i "s~MEDIAWIKI_APIS_URI~${MEDIAWIKI_APIS_URI:-http://http/api.php}~" /srv/restbase/config.yaml &&\
    sed -i "s~PARSOID_URI~${PARSOID_URI:-http://parsoid:8000}~" /srv/restbase/config.yaml &&\
    sed -i "s~MEDIAWIKI_APIS_DOMAIN~${MEDIAWIKI_APIS_DOMAIN:-femiwiki.com}~" /srv/restbase/config.yaml &&\
    node server.js
