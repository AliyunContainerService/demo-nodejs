FROM node:5.7.1-slim
MAINTAINER Ringtail  <zhongwei.lzw@alibaba-inc.com>

ADD ./ /workspace

EXPOSE 3000
EXPOSE 22

WORKDIR /workspace

ENV BACKEND http://127.0.0.1:80/incr

ENTRYPOINT ["node","lib/demo_server.js"]
