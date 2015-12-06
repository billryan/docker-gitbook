# docker-gitbook

A Docker Container for [gitbook](https://github.com/GitbookIO/gitbook). Inspired by 

- [grahamc/docker-jekyll](https://github.com/grahamc/docker-jekyll)
- [tobegit3hub/gitbook-server](https://github.com/tobegit3hub/gitbook-server)

Docker Hub: <https://hub.docker.com/r/billryan/gitbook/>

## Usage

Read the official documentation [GitbookIO/gitbook](https://github.com/GitbookIO/gitbook#how-to-use-it) first.

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

Build **your favourite fonts** with GitBook(PDF, EPUB). Visit [billryan/gitbook/tags](https://hub.docker.com/r/billryan/gitbook/tags/) to see whether your favourite languages/fonts are listed here. You can also check the GitHub branch since the docker hub is automated-build from GitHub.

## Contributing

Wanna nice fonts for your GitBook? Here we go!

1. checkout a new branch named with your languages and fonts. The name of languages should follow the [List of ISO 639-2 codes](https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes) and [rfc4646](http://www.ietf.org/rfc/rfc4646.txt), and the length of the name should as short as possible.
```bash
git checkout -b new-branch master
```
2. Modify the following lines with your favourite fonts.
```bash
# install fonts
RUN apt-get update \
        && apt-get install -y fonts-your-language
```

## License

[The MIT License (MIT)](https://opensource.org/licenses/MIT)
