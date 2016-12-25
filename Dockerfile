FROM alpine:latest
MAINTAINER Matjaž Finžgar <matjaz.finzgar@gmail.com>

ENV version=1.2.18

RUN apk add --update wget tar ca-certificates && rm -rf /var/cache/apk/*
RUN wget https://github.com/mumble-voip/mumble/releases/download/${version}/murmur-static_x86-${version}.tar.bz2
RUN tar -xvf murmur-static_x86-${version}.tar.bz2 && \ 
    mv murmur-static_x86-${version} /app && \
    rm murmur-static_x86-${version}.tar.bz2

ADD ./murmur.ini /app/murmur.ini
ADD ./fullchain.pem /app/fullchain.pem
ADD ./privkey.pem /app/privkey.pem

EXPOSE 64738/tcp 64738/udp

ENTRYPOINT ["/app/murmur.x86", "-fg", "-v"]
CMD ["-ini", "/app/murmur.ini"]
