DOCKER_IMAGE=streamdal/betterproto
VERSION ?= $(shell git rev-parse --short HEAD)
SHORT_SHA ?= $(shell git rev-parse --short HEAD)

help: HELP_SCRIPT = \
	if (/^([a-zA-Z0-9-\.\/]+).*?: description\s*=\s*(.+)/) { \
		printf "\033[34m%-40s\033[0m %s\n", $$1, $$2 \
	} elsif(/^\#\#\#\s*(.+)/) { \
		printf "\033[33m>> %s\033[0m\n", $$1 \
	}

.PHONY: help
help:
	@perl -ne '$(HELP_SCRIPT)' $(MAKEFILE_LIST)

.PHONY: docker/build
docker/build: ## Build docker image
docker/build:
	docker buildx build --push --platform=linux/amd64,linux/arm64 \
		-t $(DOCKER_IMAGE):$(SHORT_SHA) \
		-t $(DOCKER_IMAGE):latest \
		.