FROM node:18.1.0 as builder

WORKDIR /home/

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx_image:1
EXPOSE 3002

COPY --from=builder /app/build /usr/share/nginx/html