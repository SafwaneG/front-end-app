FROM node:latest as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build 

# Stage 2
FROM nginx:1-alpine-slim

COPY --from=build /app/dist/angular-16-crud /usr/share/nginx/html

EXPOSE 80

