# Use official Node.js LTS image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# Copy package files first for better layer caching
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --only=production

# Bundle app source
COPY server.js .
COPY public/ public/
COPY package.json .

# Create data directory
RUN mkdir -p /usr/src/app/data

# Environment variables
ENV PORT=7860
ENV NODE_ENV=production

# Expose the port the app runs on
EXPOSE 7860

# Command to run the application
CMD [ "node", "server.js" ]
