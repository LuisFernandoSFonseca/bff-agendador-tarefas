FROM maven:3.9-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY . .
RUN mvn clean install -DskipTest

FROM eclipse-temurin:17-alpine-3.20

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8083

CMD ["java", "-jar", "app.jar"]

#Docker file padrão pra MAVEN, o que está sendo utilizado acima, é o arquivo para fazer um docker compose de todo o projeto
#FROM eclipse-temurin:17-alpine-3.20
#
#WORKDIR /app
#
#COPY target/bff-agendador-tarefas-0.0.1-SNAPSHOT.jar /app/bff-agendador-tarefas.jar
#
#EXPOSE 8083
#
#CMD ["java", "-jar", "/app/bff-agendador-tarefas.jar"]