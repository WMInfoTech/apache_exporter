FROM golang:1.13 AS build

WORKDIR /go/src/github.com/Lusitaniae/apache_exporter
COPY . /go/src/github.com/Lusitaniae/apache_exporter
RUN CGO_ENABLED=0 GOOS=linux go build -a -o apache_exporter

FROM scratch

COPY --from=build /go/src/github.com/Lusitaniae/apache_exporter/apache_exporter /apache_exporter

ENTRYPOINT ["/apache_exporter"]
EXPOSE     9117
