Dockerized restbase server [![Container Registry]][Container Registry Link]
========

A [RESTBase] Docker image that uses SQLite as its database. This is originally created for [FemiWiki].

## Usage

The following command starts RESTBase container:

```sh
docker run -p 7231:7231 [-e MEDIAWIKI_APIS_URI=...] [-e MEDIAWIKI_APIS_DOMAIN=...] [-e PARSOID_URI=...] femiwiki/restbase
```

Then, access it via http://localhost:7231 in a browser.

### Environment Variables

Variables | Default | Description
--|--|--
MEDIAWIKI_APIS_URI | `http://http/api.php` | API path for you wiki. (must be accessible by docker container)
MEDIAWIKI_APIS_DOMAIN | `femiwiki.com` | Same as `$wgVirtualRestConfig['modules']['restbase']['domain']` defined in [LocalSettings.php](https://www.mediawiki.org/wiki/Manual:LocalSettings.php) ([details](https://www.mediawiki.org/wiki/RESTBase/Installation#Configuration))
PARSOID_URI | `http://parsoid:8000` | URI for Parsoid. (must be accessible by docker container)
MATHOID_URI | `http://mathoid:10044` | URI for Mathoid. (must be accessible by docker container)

## Build

```sh
docker build --tag femiwiki/restbase .
docker push femiwiki/restbase
```

&nbsp;

--------

The source code of *femiwiki/restbase* is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[Container Registry]: https://badgen.net/badge/icon/docker?icon=docker&label
[Container Registry Link]: https://github.com/orgs/femiwiki/packages/container/restbase
[FemiWiki]: https://femiwiki.com
[RESTBase]: https://www.mediawiki.org/wiki/RESTBase
[GNU Affero General Public License v3.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
