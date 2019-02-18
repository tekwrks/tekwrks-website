project=tekwrks
name=tekwrks-website

.PHONY: build
build:
	docker image build \
		-t ${repo}/${name}:latest \
		.

.PHONY:run
run:
	docker container run \
		--rm \
		--name ${project}-${name}-dev \
		-p 3000:80 \
		-t ${project}/${name}:latest

.PHONY:kill
kill:
	docker kill $$( \
		docker ps -aq \
			--filter="name=${project}-${name}-dev" )

