# Use an official Maven image as a base image
#FROM maven:3.8.1-openjdk-11-slim AS build

# Set the working directory in the container
#WORKDIR /app

# Copy the source code to the container
#COPY . .

# Build the Maven project
#RUN mvn clean install

# Use a lightweight OpenJDK runtime image as the final image
FROM openjdk:11-jre-slim

# Set the working directory in the container
#WORKDIR /app

# Copy the built JAR file from the Maven image
#COPY --from=build /app/target/your-artifact-id-your-version.jar app.jar

# Expose the port on which your application will run
EXPOSE 8080

ADD target/maven-integration.jar maven-integration.jar

# Command to run your application
ENTRYPOINT ["java", "-jar", "/ maven-integration.jar"]
