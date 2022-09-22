#
# Development
#
FROM node:14 AS development

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm i
COPY . ./
RUN npm run build-dev

#
# Production
#
FROM node:14 as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production
COPY . ./
COPY --from=development /usr/src/app/dist /usr/src/app/dist/
CMD ["npm", "start-public"]
