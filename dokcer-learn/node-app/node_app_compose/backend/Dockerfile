# install the parent image
FROM  arm64v8/node

# nodemon is used for restrating the server each time app file is updated
RUN npm install -g nodemon

# cd to the app directory 
WORKDIR /app

# copy the source code to the image
COPY . .

# run command is used only while building the image 
# best-use is to install dependencies 
RUN npm install 

# expose a port by the container 
EXPOSE 4000

# this command used to run the script name 'dev' in the package.json 
# dev script "nodemon -L app.js" to watch the changes in the app.js 
CMD ["npm", "run", "dev"]
