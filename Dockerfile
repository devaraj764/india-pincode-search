# Use official Node.js image as the base image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or just package.json if you don't use lock file)
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the application will run on
EXPOSE 3000

# Command to run json-server
CMD ["npx", "json-server", "--watch", "db.json", "--port", "3000"]
