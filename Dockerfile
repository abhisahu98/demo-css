# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the website files from the current directory to the Nginx directory
COPY . .

# Expose port 81
EXPOSE 81

# Start Nginx (this is the default command for the Nginx image)
CMD ["nginx", "-g", "daemon off;"]
