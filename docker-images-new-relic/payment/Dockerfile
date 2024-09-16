FROM          python:3
RUN           mkdir /app
WORKDIR       /app
COPY          code/ /app/
RUN           pip3 install -r requirements.txt
COPY          run.sh /
ENTRYPOINT    ["bash", "/run.sh"]


