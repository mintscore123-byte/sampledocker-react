
#Build phase

FROM node:20-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build folder <--has all the stuff


#RUN  phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 







