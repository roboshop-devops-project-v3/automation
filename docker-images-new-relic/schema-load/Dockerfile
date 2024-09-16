FROM        docker.io/redhat/ubi9
RUN         mkdir /app
WORKDIR     /app
COPY        mongo.repo /etc/yum.repos.d/mongo.repo
RUN         dnf install mongodb-mongosh mysql git -y
COPY        run.sh /
ENTRYPOINT  ["bash", "/run.sh"]


