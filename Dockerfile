# Light weight base image for building Java applications
FROM eclipse-temurin:17-jre-alpine

# Set non-root user for security
RUN addgroup -S devopsgroup && adduser -S devopsuser -G devopsgroup
USER devopsuser

# Set working directory
WORKDIR /devops/devopsuser

# Expose only the port your app listens on
EXPOSE 8080

# Copy the jar file from the target directory to the working directory
COPY target/EcommereceApp-rest-0.0.1-SNAPSHOT.jar app.jar

# Entrypoint: Start app with env-based config
ENTRYPOINT ["java", "-jar", "app.jar"]
