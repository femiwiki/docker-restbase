Dockerized restbase server [![Docker Hub Status]][Docker Hub Link]
========

[페미위키]를 위한 [RESTBase] Docker Image

## 실행하기

다음 명령으로 RESTBase를 7231 포트로 열 수 있습니다.

```sh
docker run -p 7231:7231 femiwiki/restbase [-e MEDIAWIKI_APIS_URI=...] [-e MEDIAWIKI_APIS_DOMAIN=...] [-e PARSOID_URI=...]
```

이후 [http://localhost:7231](http://localhost:7231)에 접속하여 작동을 확인해 주세요.

### 환경 변수

| 이름 | 기본값 | 설명 |
--|--|--
MEDIAWIKI_APIS_URI | `https://femiwiki.com/api.php` | 위키의 API path. Container 안에서 접근할 수 있는 것이어야 합니다.
MEDIAWIKI_APIS_DOMAIN | `femiwiki.com` | 위키의 [LocalSettings.php](https://www.mediawiki.org/wiki/Manual:LocalSettings.php)에서 정의한 `$wgVirtualRestConfig['modules']['restbase']['domain']`과 동일한 값 ([자세한 설명](https://www.mediawiki.org/wiki/RESTBase/Installation#Configuration))
PARSOID_URI | `http://parsoid:8000` | Parsoid의 URI. Container 안에서 접근할 수 있는 것이어야 합니다.

## 빌드

```sh
docker build --tag femiwiki/restbase .
docker push femiwiki/restbase
```

&nbsp;

--------

The source code of *femiwiki/restbase* is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[Docker Hub Status]: https://badgen.net/docker/pulls/femiwiki/restbase/?icon=docker&label=pulls
[Docker Hub Link]: https://hub.docker.com/r/femiwiki/restbase/
[페미위키]: https://femiwiki.com
[RESTBase]: https://www.mediawiki.org/wiki/RESTBase
[GNU Affero General Public License v3.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
