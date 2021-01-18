FROM node:8

WORKDIR /app

RUN useradd -ms /bin/bash aws-es-kibana
RUN chown aws-es-kibana:aws-es-kibana /app

COPY package.json /app
RUN npm install
COPY index.js /app

EXPOSE 9200

## need to bind eth0 inside container, not lo0
ENTRYPOINT [ "node", "index.js", "-b", "0.0.0.0" ]
