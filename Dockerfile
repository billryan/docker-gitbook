FROM nodesource/trusty:5.0.0
MAINTAINER Bill Ryan <yuanbin2014@gmail.com>

# enable trusty-backports and multiverse(non-free), mirros.mit.edu(default)
COPY sources.list /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

# install calibre dependencies
RUN apt-get update && \
    apt-get install -y wget xz-utils xdg-utils imagemagick

# install Calibre latest
RUN wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py \
        | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

# install gitbook-cli
RUN npm install gitbook-cli -g && \
    npm install svgexport -g

# install fonts and remove extra temp files
#RUN apt-get install -y fonts-noto-cjk fonts-noto-hinted && \
#    rm -rf /var/lib/apt/lists/*

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
