FROM maven:3.6.0-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean install -DskipTests

FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/*.jar /usr/local/lib/demo.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
