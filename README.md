# docker-gitbook

A Docker Container for [gitbook](https://github.com/GitbookIO/gitbook). Inspired by 

- [grahamc/docker-jekyll](https://github.com/grahamc/docker-jekyll)
- [tobegit3hub/gitbook-server](https://github.com/tobegit3hub/gitbook-server)

Docker Hub: <https://hub.docker.com/r/billryan/gitbook/>

## Usage

Read the official documentaion [GitbookIO/gitbook](https://github.com/GitbookIO/gitbook#how-to-use-it) first.

```bash
# init
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook init
# serve
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook serve
# build
docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook build
```

For short, you can use alias for the long command line text. Just place the alias statement in your `.bashrc` or `.zshrc`.

```bash
alias gitbook='docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook'
# init
gitbook init
# serve
gitbook serve
# build
gitbook build
```

### User Priviledge

Since docker **can not** config uid and gid for shared volume properly(see [Issue #7198](https://github.com/docker/docker/issues/7198)), you can build it with your own uid and gid in the Dockerfile.

## Features

An elegant CJK-fonts sets built-in.

## License

[The MIT License (MIT)](https://opensource.org/licenses/MIT)
