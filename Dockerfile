# Build
FROM golang:1.18-alpine as build

WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go build -o /main


# Run
FROM scratch
WORKDIR /
COPY --from=build /main /main
CMD [ "/main" ]