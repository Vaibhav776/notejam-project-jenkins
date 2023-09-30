FROM node:latest

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . .

RUN node db.js

EXPOSE 3000

CMD ["npm","start"]