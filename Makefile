SHELL=bash
DOCKER=@docker


DOCKERFILE=Dockerfile
TAG=$(shell date +'%y-%m-%d')-$(shell git log --pretty=format:%h -1)
DOCKERREPO ?=
APP_VERSION ?=

all: docker-build

docker-build: guard-DOCKERREPO guard-PROJECT guard-TAG guard-APP_VERSION
	$(DOCKER) build . \
		-f $(DOCKERFILE) \
		-t $(DOCKERREPO)/$(PROJECT):$(TAG) \
		-t $(DOCKERREPO)/$(PROJECT):$(APP_VERSION)

docker-push: guard-DOCKERREPO guard-PROJECT guard-TAG
	$(DOCKER) push --all-tags \
		$(DOCKERREPO)/$(PROJECT)

guard-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

.PHONY: all docker-build docker-push docker-push-latest guard-%