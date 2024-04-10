FROM alpine:latest
FROM docker:dind
RUN apk add --no-cache go
RUN CGO_ENABLED=0

#WORKDIR /sportsstore
#COPY sportsstore /app/
ADD   sportsstore/ /app/sportsstore
ADD platform/ /app/platform

# COPY go.mod go.sum *.go /app/
# COPY templates /app/templates
# COPY sql/* /app/sql/
# COPY files/* /app/files/
# COPY config.json /app/
# COPY certificate.* /app/


EXPOSE 5500
WORKDIR /app/sportsstore
#RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o ./ .


RUN go mod download
RUN go build -v -o   .
#COPY sportsstore /app/  
#./...
ENTRYPOINT ["./sportsstore", "./platform"]
#, "./platform"

#CMD ["sportsstore"]
#CMD ["go", "run", "main.go"]
CMD [ "/sportsstore" ]
