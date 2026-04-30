FROM node:20-alpine

RUN apk add --no-cache git

WORKDIR /app

RUN git clone --depth 1 https://github.com/binary-person/rammerhead.git . \
    && npm install --omit=dev

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=8080
EXPOSE 8080

CMD ["/start.sh"]
