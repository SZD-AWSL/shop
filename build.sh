#!/usr/bin/env bash
set  CGO_ENABLED=0
cd ./sportsstore
go build -v -o   .
go run sportsstore
#cd ./app/ && chmod +x main && ./main
#go build -tags netgo -ldflags '-s -w' -o app

