FROM baden/debian
MAINTAINER Denys Batrak baden.i.ua@gmail.com

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update -qq && \
    apt-get install -y xz-utils inotify-tools && \
    apt-get -qq clean

RUN mkdir /node && \
    cd /node && \
    curl -O https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz && \
    tar xf ./node-v4.4.7-linux-x64.tar.xz && \
    rm ./node-v4.4.7-linux-x64.tar.xz

ENV PATH /node/node-v4.4.7-linux-x64/bin/:${PATH}

# root entrypoint
RUN mkdir /app
WORKDIR /app

# Install some for user composer

RUN USER_ID=1000 GROUP_ID=1000 /entrypoint.sh true

ARG PORT=4000
ENV PORT=${PORT}

EXPOSE ${PORT}

CMD ["bash"]
