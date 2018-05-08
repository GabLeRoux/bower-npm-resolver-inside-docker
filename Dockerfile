FROM node:8

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
COPY .bowerrc ./
COPY bower.json ./
RUN npm run bower -- install --allow-root
COPY . .

CMD [ "npm", "start" ]

