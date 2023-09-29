#Build

FROM maven:3.8.6-openjdk-18-slim AS build

WORKDIR /home/app/src

COPY . /home/app/src

RUN mvn clean package -DskipTests 



#Package

FROM openjdk:18.0.2

COPY --from=build /home/app/src/target/spring-boot-hello-world-1.0.0-SNAPSHOT.jar /usr/local/lib/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/usr/local/lib/app.jar"]
