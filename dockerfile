# syntax=docker/dockerfile:1

# Use an official Golang runtime as a base image
FROM golang:1.21 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the source code from the current directory to the working directory inside the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o ascii-art-web .

# Use a minimal base image to reduce the final image size
FROM alpine:latest

# Copy the binary file from the build stage to the current working directory in the container
COPY --from=build /app/ascii-art-web .

COPY . .

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD ["./ascii-art-web"]
