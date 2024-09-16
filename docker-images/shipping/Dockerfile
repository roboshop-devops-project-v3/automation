FROM        docker.io/redhat/ubi9
RUN         mkdir /app
WORKDIR     /app
COPY        code/ /app/
RUN         dnf install maven -y
RUN         mvn clean package && mv target/shipping-1.0.jar shipping.jar
COPY        run.sh /
ENTRYPOINT ["bash", "/run.sh"]