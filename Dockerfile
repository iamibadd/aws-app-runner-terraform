FROM --platform=linux/amd64 node:18.12.1-alpine3.16
# best practice
USER root
# execution folder
WORKDIR /app
# copy all files from host to source (container)
COPY . /app
# best practice
ENV PATH /app/node_modules/.bin:$PATH
# environment variables here
ENV PORT 80
# look for any change in package.json file and then only run the below two commands
COPY package.json /app/package.json
# install latest node version
RUN npm -g install npm@latest
# install dependencies
RUN npm install
# starts the application
CMD ["npm", "start"]

