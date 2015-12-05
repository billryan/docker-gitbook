FROM nodesource/trusty:0.12.7
MAINTAINER Bill Ryan <yuanbin2014@gmail.com>

# install Calibre latest and gitbook-cli
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py \
        | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" \
        && npm install gitbook-cli -g

# install gitbook versions
RUN gitbook versions:install latest

# add non-root user(workaround for docker)
# replace gid and uid with your currently $GID and $UID
#RUN useradd -m -g 100 -u 1000 gitbook

ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

ENTRYPOINT ["gitbook"]
CMD ["--help"]

#USER gitbook
