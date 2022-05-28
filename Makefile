.DEFAULT_GOAL := help

.PHONY: publish
publish: ## Publish packages.
	make build
	cd ./axios && npm version patch && npm publish
	cd ./node && npm version patch && npm publish

.PHONY: build
build: ## Build packages.
	cd ./axios && npm run build
	cd ./node && npm run build

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
