FROM ich777/winehq-baseimage

LABEL maintainer="admin@unraider.net"

RUN apt-get update && \
	apt-get -y install lib32gcc1 winbind xvfb screen && \
	rm -rf /var/lib/apt/lists/*

ENV DATA_DIR="/serverdata"
ENV STEAMCMD_DIR="${DATA_DIR}/steamcmd"
ENV SERVER_DIR="${DATA_DIR}/serverfiles"
ENV GAME_ID="template"
ENV GAME_PARAMS="template"
ENV GAME_PARAMS_EXTRA="template"
ENV MAX_PLAYERS="template"
ENV SERVER_NAME="template"
ENV SERVER_PASSWORD=""
ENV SERVER_ADMIN_PASSWORD=""
ENV GAME_PORT=27015
ENV QUERY_PORT=27016
ENV RCON_PORT=27017
ENV VALIDATE="true"
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV USER="steam"
ENV DATA_PERM=770

RUN mkdir $DATA_DIR && \
	mkdir $STEAMCMD_DIR && \
	mkdir $SERVER_DIR && \
	useradd -d $DATA_DIR -s /bin/bash $USER && \
	chown -R $USER $DATA_DIR && \
	ulimit -n 2048

ADD /scripts/ /opt/scripts/
RUN chmod -R 770 /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start.sh"]
