FROM node:latest

WORKDIR /usr/src/app

COPY package*.json ./
COPY ./web-files/ /html/
COPY ./scripts/creatorLog.sh /scripts/cteatorLog.sh
COPY ./scripts/watchLog.sh /scripts/watchLog.sh
COPY ./web-files/index.html /html/
COPY ./web-files/style.css /html/
COPY ./web-files/script.js /html/

RUN npm install

COPY . .

EXPOSE 5000
CMD [ "node", "server.js" ]
