.PHONY: start
start:
	hugo serve --disableFastRender

.PHONY: dev
dev:
	hugo serve --buildDrafts --disableFastRender --buildFuture

.PHONY: build
build:
	hugo