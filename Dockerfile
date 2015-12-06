FROM nodesource/trusty:5.0.0
MAINTAINER Bill Ryan <yuanbin2014@gmail.com>

# install Calibre latest and gitbook-cli
# install calibre dependencies from Ubuntu repo 
RUN apt-get update \
        && apt-get install -y calibre wget \
        && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py \
        | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()" \
        && npm install gitbook-cli -g \
        && npm install svgexport -g

# replace source.list, add multiverse
COPY sources.list /etc/apt/sources.list

# install fonts
#RUN apt-get update \
#        && apt-get install -y fonts-your-language

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
