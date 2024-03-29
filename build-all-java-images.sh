#!/bin/bash

echo "Batch Java Docker image builder v. 1.0.0"
echo "----------------------------------------"

# shellcheck disable=SC2046
export $(grep -E -v '^#' .env | xargs)

declare RED='\033[0;31m'
declare NC='\033[0m' # No Color

(cd jdk-8 && make build multiarch)
(cd jdk-11 && make build multiarch)
(cd jdk-14 && make build multiarch)
(cd jdk-15 && make build multiarch)
(cd jdk-16 && make build multiarch)
(cd jdk-17 && make build multiarch)


trivy image "$IMAGE_NAME":8
trivy image "$IMAGE_NAME":11
trivy image "$IMAGE_NAME":14
trivy image "$IMAGE_NAME":15
trivy image "$IMAGE_NAME":16
trivy image "$IMAGE_NAME":17
