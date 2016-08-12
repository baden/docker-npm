DOCKER_IMAGE_NAME := baden-npm
DOCKER_TAG_NAME := latest

DOCKER_PORT ?= 4000

# DOCKER_LANG := ru_UA.UTF-8

build:
	docker build --build-arg PORT=$(DOCKER_PORT) -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

build-nocache:
	docker build --build-arg PORT=$(DOCKER_PORT) --no-cache -t $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME) .

run:
	docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)

run-as-user:
	docker run -it --rm -p $(DOCKER_PORT):$(DOCKER_PORT) -e USER_ID=`id -u` -e GROUP_ID=`id -g` -v `pwd`:/home/composer/app -w /home/composer/app $(DOCKER_IMAGE_NAME):$(DOCKER_TAG_NAME)
