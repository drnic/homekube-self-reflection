FROM golang:alpine AS build
ADD . /buildspace
WORKDIR /buildspace
RUN \
  go build -o homekube-self-reflection ./...

FROM alpine AS app
COPY --from=build /buildspace/homekube-self-reflection /usr/bin/homekube-self-reflection
CMD [ "/usr/bin/homekube-self-reflection" ]

FROM app
