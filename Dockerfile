FROM maven:3.8.1-openjdk-11-slim AS build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src/ src/
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim
COPY --from=build target/sample-0.0.1-SNAPSHOT.jar sample.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "sample.jar"]