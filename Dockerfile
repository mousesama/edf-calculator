# Build stage
FROM node:16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY edf-calculator/package.json edf-calculator/package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY ./edf-calculator/* .

# Build the app
RUN npm run build

# Final stage
FROM nginx:stable-alpine AS final

# Copy the built assets from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Copy Nginx configuration file
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]

