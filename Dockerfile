FROM maven:3.9.6-eclipse-temurin-23-jammy as build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:23-jdk
COPY --from=build /target/websocket_demo-0.0.1-SNAPSHOT.jar websocket_demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "websocket_demo.jar"]
