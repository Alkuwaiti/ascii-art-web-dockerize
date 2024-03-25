# syntax=docker/dockerfile:1

# Use an official Golang runtime as a base image
FROM golang:1.21 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the source code from the current directory to the working directory inside the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o ascii-art-web .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./ascii-art-web"]

# Mistake: I was using a base image, but then using another base image (alpine) which only had the binary was then run, but because the binary didn't have access to the html from the original source code, it couldn't find it. so i got rid of the second lightweight base image all together.