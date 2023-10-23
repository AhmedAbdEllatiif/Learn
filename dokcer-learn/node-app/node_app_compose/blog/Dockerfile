# choose alpine version best choice for web apps
FROM node:16-alpine

# change working directory
WORKDIR /app

# copy package.json into the current directory   
COPY package.json .

# install required packages
RUN npm install

# copy all current host machine directory into the current container directory
COPY . .

# required for docker desktop port mapping
EXPOSE 3000

# this command used to run the script name 'start' in the package.json 
CMD ["npm", "start"]