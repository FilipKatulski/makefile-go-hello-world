FROM golang:1.18-alpine
 
WORKDIR /app
 
COPY *.go ./
RUN go mod init example.com/m 
 
RUN go build -o /hello-world
 
CMD ["/hello-world"]

