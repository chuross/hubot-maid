FROM node:6.5.0

RUN apt-get update && apt-get install -y redis-tools
RUN npm install -g hubot coffee-script

ENV HUBOT_MAID_WORKDIR ~/workspace
ENV REDIS_URL redis

WORKDIR $HUBOT_MAID_WORKDIR

COPY bin bin/
COPY scripts scripts/
COPY external-scripts.json .
COPY hubot-scripts.json .
COPY package.json .

RUN npm install

CMD ["bash", "bin/hubot"]