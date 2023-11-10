# Build stage
FROM maven:3.6.3-openjdk-8 AS build
WORKDIR /app
COPY . /app
RUN mvn -DskipTests clean package

# Run stage
FROM openjdk:8-jdk-alpine
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar","app.jar"]