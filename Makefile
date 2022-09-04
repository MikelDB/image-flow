SHELL=/bin/bash

.DEFAULT_GOAL := help


help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## Install dependencies
	docker-compose run frontend rm -rf node_modules
	docker-compose run frontend yarn

up: ## Spin up the project
	docker-compose up

down: ## Bring down the environment
	docker-compose down
	docker stop $(docker ps -aq)

restart: ## Bring down the environment and Spin it up again
	docker-compose down
	docker-compose up