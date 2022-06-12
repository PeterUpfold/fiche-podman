FROM alpine:latest

WORKDIR /usr/src/app

RUN adduser -h /usr/src/app -s /bin/sh -u 10003 -D fiche && apk add --no-cache gcc musl-dev make


COPY ./ /usr/src/app
RUN make

RUN chown -R fiche /usr/src/app

USER fiche

CMD [ "/usr/src/app/fiche", "-p", "30005" ]

EXPOSE 30005