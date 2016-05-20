FROM node:5
MAINTAINER Rhett <yuanbin2014@gmail.com>

# install calibre dependencies
RUN apt-get update && \
    apt-get install -y calibre && \
    npm install gitbook-cli -g && \
    npm install svgexport -g && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# install fonts and remove extra temp files
#RUN apt-get install -y fonts-noto-cjk fonts-noto-hinted && \
#    rm -rf /var/lib/apt/lists/*

# add non-root user(workaround for docker)
# replace gid and uid with your currently $GID and $UID
#RUN useradd -m -g 100 -u 1000 gitbook
#USER gitbook

# install gitbook versions
RUN gitbook fetch latest

ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

CMD ["gitbook", "--help"]
