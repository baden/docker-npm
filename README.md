# docker-npm [![](https://images.microbadger.com/badges/image/baden/npm.svg)](https://microbadger.com/images/baden/npm "Get your own image badge on microbadger.com")

My base docker image for npm-based developmenting.

## Build local image

```
  make build
```

## Run local image

Setup user privilegies:

```
export D_OPTS="-e USER_ID=`id -u` -e GROUP_ID=`id -g` -v `pwd`:/home/composer/app -w /home/composer/app baden-npm"
```

or global:

```
export D_OPTS="-e USER_ID=`id -u` -e GROUP_ID=`id -g` -v `pwd`:/home/composer/app -w /home/composer/app baden/npm"
```

Initializing npm-based project

```
  docker run -it --rm $D_OPTS npm init
```

You can create empty project like:

```
  mix phoenix.new myproject
```

## Run image from [DockerHUB](https://hub.docker.com/r/baden/phoenix/)

No need clone repository. You can use this method from anywhere.

```
  docker run -it --rm baden/phoenix
```

## Run with user privilegies:

```
docker run -it --rm -e USER_ID=`id -u` -e GROUP_ID=`id -g` -v `pwd`:/home/composer/code -w /home/composer/code baden/phoenix
```
