# Start with the official Node.js image.
FROM node:20-alpine as build-deps

# Set the working directory
WORKDIR /app

# Copy package.json to the workdir
COPY package*.json .

# Install dependencies
RUN npm ci

# Copy all other project files
COPY . .

RUN npm run build

# Start the app
FROM nginx

COPY --from=build-deps /app/build /usr/share/nginx/html

EXPOSE 80

# daemon off; tells Nginx to run in the foreground
CMD ["nginx", "-g", "daemon off;"]
