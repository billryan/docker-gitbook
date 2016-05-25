FROM node:5
MAINTAINER Rhett <yuanbin2014@gmail.com>

# install calibre dependencies and gitbook-cli
RUN apt-get update && \
    apt-get install -y unzip calibre && \
    npm install gitbook-cli -g && \
    npm install svgexport -g && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# install Arial fonts
RUN wget -P /tmp/raw_fonts https://github.com/billryan/algorithm-exercise/files/279471/arial.zip && \
    cd /tmp/raw_fonts && \
    unzip -o arial.zip && \
    mv -t /usr/share/fonts/truetype Arial*ttf && \
    rm arial.zip && \
    fc-cache -f -v
