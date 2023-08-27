FROM adoptopenjdk/openjdk11:alpine-jre

RUN mkdir /app 
WORKDIR /app
COPY target/java-maven-app-1.1.0-SNAPSHOT.jar app.jar
CMD [ "java","-jar","app.jar" ]