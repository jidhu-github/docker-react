FROM node:alpine as build-phase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm" , "run" , "build"]

#Folder "/app/build" with all the artifacts from build-phase
FROM nginx as run-phase
EXPOSE 80
#COPY from previous builder-phase
COPY --from=build-phase /app/build /usr/share/nginx/html
