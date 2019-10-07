FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# This will tell aws beanstalk to run app on port 80
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
