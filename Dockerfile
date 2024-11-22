# Use the official Node.js LTS image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install all dependencies
RUN npm install --legacy-peer-deps

# Set the NODE_OPTIONS environment variable to use the legacy OpenSSL provider
ENV NODE_OPTIONS=--openssl-legacy-provider

# Set the port environment variable
ENV PORT=4000

# Copy the entire project directory into the container
COPY . .

# Expose the application port
EXPOSE 4000

# Set the default command to run the application
CMD ["npm", "start"]

