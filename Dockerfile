FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/centos/src
COPY pom.xml /home/centos
RUN mvn -f /home/centos/pom.xml clean install -DskipTests

FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/home/centos/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
