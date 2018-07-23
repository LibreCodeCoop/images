# PHP + APACHE [DEV]

reference: `https://hub.docker.com/r/webdevops/php/`

pull: `$ docker pull lyseontech/php-apache-dev`

## Environment

Propriedades disponíveis:
- DOCUMENT_ROOT=/app
- APPLICATION_PATH=/app
- CONTAINER_UID=application
- APPLICATION_USER=application
- APPLICATION_GROUP=application
- APPLICATION_UID=1000
- APPLICATION_GID=1000

## Tags

- [latest](https://github.com/LyseonTech/images/blob/master/php-apache-dev/latest/Dockerfile)
- [v7.3](https://github.com/LyseonTech/images/blob/master/php-apache-dev/7.3/Dockerfile)
- [v7.2](https://github.com/LyseonTech/images/blob/master/php-apache-dev/7.2/Dockerfile)
- [v7.1](https://github.com/LyseonTech/images/blob/master/php-apache-dev/7.1/Dockerfile)
- [v7.0](https://github.com/LyseonTech/images/blob/master/php-apache-dev/7.0/Dockerfile)

## Examples

```bash
$ docker run lyseontech/php-apache-dev php -v
```

```yaml
version: '3'

services:
  php-app:
    image: lyseontech/php-apache-dev
    container_name: php-app
```
