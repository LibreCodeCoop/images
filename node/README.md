# Node

reference: `https://hub.docker.com/_/node/`

pull: `$ docker pull lyseontech/node`

## Tags

- [latest](https://github.com/LyseonTech/images/blob/master/node/latest/Dockerfile)
- [v10.0.6](https://github.com/LyseonTech/images/blob/master/node/10.0.6/Dockerfile)
- [v9.11.2](https://github.com/LyseonTech/images/blob/master/node/9.11.2/Dockerfile)
- [v9.11.1](https://github.com/LyseonTech/images/blob/master/node/9.11.1/Dockerfile)

## Examples

```bash
$ docker run lyseontech/node node -v
```

```yml
version: '3'

services:
    node-app:
        image: lyseontech/node
        container_name: node-app
```
