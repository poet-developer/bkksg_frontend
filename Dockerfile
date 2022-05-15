FROM node:18.1.0 as builder

WORKDIR /home/

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 3002

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /home/build /usr/share/nginx/html