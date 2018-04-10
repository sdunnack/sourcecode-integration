# InVision's base alpine image for node

# alpine
FROM node:6-alpine

# non-alpine
# FROM node:6

WORKDIR /srv/app

# alpine
# install additional packages
#  - for build process: python make gcc g++ git
#  - for running sourceclear: curl bash tar gzip openjdk8-jre (moved into codeship-steps.yml)
#
# for non-alpine can comment out line below
RUN apk add --update python make gcc g++ git

# Install node modules (allows for npm install to be cached until package.json changes)
COPY package.json ./
RUN npm install

# Copy our source files to the service location
COPY src ./src

# Set default environment variables
ENV \
	PATH=/srv/app:/srv/app/node_modules/.bin:/bin:$PATH\
	DEBUG=false\
	PORT=80

# Start the server
CMD ["npm", "start"]
