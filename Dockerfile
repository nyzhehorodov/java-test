FROM maven:3.6.3-jdk-8 as build
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests
FROM openjdk:8-jre
COPY --from=build /app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app.jar"]