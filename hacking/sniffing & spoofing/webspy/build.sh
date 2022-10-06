#!/usr/bin/env bash

BINARY_NAME=webspy
LDFLAGS="-s -w"
echo "Pulling all commits..."
#git pull

OS_ARCH="linux:amd64"
for n in $OS_ARCH
do
    OS=$(echo "$n" | cut -d : -f 1)
    ARCH=$(echo "$n" | cut -d : -f 2)
    echo "Building ${OS}_${ARCH} ...."
    export CGO_ENABLED=1
    export GOOS="${OS}"
    export GOARCH="${ARCH}"
    EXTENSION=""
    if [ "$OS" = "windows" ] ;then
      EXTENSION=".exe"
    fi
    go build -ldflags "${LDFLAGS}" -o ./builds/"${OS}"/"${BINARY_NAME}"-"${OS}-${ARCH}${EXTENSION}"
done

echo "Finished Building"
