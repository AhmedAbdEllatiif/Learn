# install the parent image
FROM  arm64v8/node

# cd to the app directory 
WORKDIR /app

# copy the source code to the image
COPY . .

# run command is used only while building the image 
# best-use is to install dependencies 
RUN npm install 

# expose a port by the container 
EXPOSE 4000

# uses while the container starts to run
CMD ["node", "app.js"]
