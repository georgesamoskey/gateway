# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-17 AS build
# Set the working directory in the container
WORKDIR /gateway
# Copy the pom.xml and the project files to the containers
COPY pom.xml .
COPY src ./src
# Build the application using Maven
RUN mvn  clean package -Dmaven.test.skip=true
# Use an official OpenJDK image as the base 
FROM openjdk:17
# Set the working directory in the con
WORKDIR /gateway
# Copy the built JAR file from the previous stage
COPY --from=build /gateway/target/*.jar app.jar

# Set the command to run the applications
CMD ["java", "-jar", "app.jar"]
