FROM maven:3.6.3-jdk-11 as build-stage
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ ./src/
RUN mvn package
FROM openjdk:11-jre-slim as run-stage
WORKDIR /app
COPY --from=build-stage /app/target/sample-0.0.1-SNAPSHOT.jar ./app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]