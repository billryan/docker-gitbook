FROM billryan/gitbook:base
MAINTAINER Rhett <yuanbin2014@gmail.com>

# add non-root user(workaround for docker)
# replace gid and uid with your currently $GID and $UID
#RUN useradd -m -g 100 -u 1000 gitbook
#USER gitbook

# install fonts Noto Sans CJK SC for Simplified Chinese
RUN wget -P /raw_fonts https://noto-website.storage.googleapis.com/pkgs/NotoSansCJKSC-hinted.zip && \
    cd /raw_fonts && \
    mkdir /usr/share/fonts/noto && \
    unzip -o NotoSansCJKSC-hinted.zip && \
    mv -t /usr/share/fonts/noto *-DemiLight.otf *-Bold.otf *-Black.otf && \
    rm -r /raw_fonts && \
    fc-cache -f -v

# install gitbook versions
RUN gitbook fetch latest

ENV BOOKDIR /gitbook

VOLUME $BOOKDIR

EXPOSE 4000

WORKDIR $BOOKDIR

CMD ["gitbook", "--help"]
