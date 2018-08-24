FROM golang:1.10.3
WORKDIR /go/src/github.com/netlify/gotrue
COPY . /go/src/github.com/netlify/gotrue/
RUN make deps build

FROM quay.io/spivegin/tlmbasedebian
COPY --from=0 /go/src/github.com/netlify/gotrue/gotrue /usr/local/bin/gotrue
COPY --from=0 /go/src/github.com/netlify/gotrue/migrations /usr/local/etc/gotrue/migrations/

ENV GOTRUE_DB_MIGRATIONS_PATH /usr/local/etc/gotrue/migrations
CMD ["gotrue"]
