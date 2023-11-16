FROM maven:3-openjdk-17-slim AS builder

COPY ./src /app

RUN cd /app && \
    mvn package -DskipTests

FROM openjdk:17-alpine

ENV TZ=Asia/Bangkok

COPY --from=builder /app/target/*.jar /app.jar  

CMD ["java", "-jar", "/app.jar"]

