FROM maven:3.5.0
VOLUME ["/app"]
WORKDIR /app
COPY . /app/
RUN mvn install \
    && apt-get update && apt-get install -y dos2unix \
    && dos2unix mvnw \
    && chmod +x mvnw
RUN ls
CMD ["./mvnw", "spring-boot:run"]