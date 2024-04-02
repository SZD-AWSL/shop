#FROM alpine:latest
FROM golang:1.20-alpine as builder
#FROM golang:1.20

#COPY go.mod go.sum ./
#RUN go env -w GOPATH=  
#RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' .


FROM builder AS build
#COPY sportsstore /app/


COPY templates /app/templates
COPY sql/* /app/sql/
COPY files/* /app/files/
COPY config.json /app/
COPY certificate.* /app/
WORKDIR /app
COPY go.mod go.sum  *.go  ./

RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"'   . 
FROM builder AS build1
ENV GOPATH=  


EXPOSE 5500


#RUN chmod 765 /app
ENTRYPOINT ["./sportsstore"] 
