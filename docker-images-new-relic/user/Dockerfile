FROM        node
RUN         mkdir /app
WORKDIR     /app
COPY        code/ /app/
RUN         npm install
COPY        run.sh /
ENTRYPOINT ["bash", "/run.sh"]