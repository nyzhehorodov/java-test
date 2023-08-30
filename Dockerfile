FROM maven:3.6.3-openjdk-8
WORKDIR /app
COPY . /app
RUN mvn package
CMD java -jar target/*.jar