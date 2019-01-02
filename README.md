Dockerized restbase server [![Docker Hub Status]][Docker Hub Link]
========

```sh
docker build --tag femiwiki/restbase .

docker run --detach \
  --name restbase \
  --restart always \
  --publish 7231:7231
  femiwiki/restbase
```

&nbsp;

--------

The source code of *femiwiki/restbase* is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[Docker Hub Status]: https://badgen.net/docker/pulls/femiwiki/restbase/?icon=docker&label=pulls
[Docker Hub Link]: https://hub.docker.com/r/femiwiki/restbase/
[GNU Affero General Public License v3.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
