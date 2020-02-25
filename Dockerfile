FROM alpine

LABEL maintainer="guozheng-yang@systechn.com"

RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache autossh

CMD ["/bin/sh"]

