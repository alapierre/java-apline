include ../.env

IMAGE_NAME=lapierre/java-alpine
IMAGE_VERSION=$(JAVA_17_VERSION)-a$(ALPINE_VERSION)$(IMAGE_POSTFIX)

build:
	docker build --no-cache --pull -t $(IMAGE_NAME):$(IMAGE_VERSION) .
	docker tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):17

push:
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):17

multiarch:
	docker buildx build --push --pull --platform=linux/arm64/v8,linux/amd64 -t $(IMAGE_NAME):17 .
	docker pull $(IMAGE_NAME):17
	docker tag $(IMAGE_NAME):17 $(IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(IMAGE_NAME):$(IMAGE_VERSION)

github:
	docker buildx build --platform linux/arm64/v8,linux/amd64 \
 		--tag "$(IMAGE_NAME):17" --tag "$(IMAGE_NAME):$(IMAGE_VERSION)" \
 		--output "type=image,push=true" .
