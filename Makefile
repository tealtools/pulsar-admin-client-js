.DEFAULT_GOAL := help

.PHONY: publish
publish: ## Publish packages.
	make build

	cd ./fetch && npm version patch

	git add .
	git commit -m "Bump version"
	git push

	cd ./fetch && npm publish

.PHONY: build
build: ## Build packages.
	cd ./fetch && npm i && npm run build

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
