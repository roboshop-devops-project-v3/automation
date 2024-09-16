FROM        docker.io/redhat/ubi9 
RUN         dnf install nginx gettext -y
RUN         rm -rf /usr/share/nginx/html/* 
COPY        code/ /usr/share/nginx/html/
COPY        nginx.conf /opt/nginx.conf
COPY        run.sh / 
ENTRYPOINT  ["bash", "/run.sh"]
