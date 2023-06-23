FROM debian:stable-slim

RUN apt update && apt -y install \
		git \
		wget \
		ca-certificates \
		bash \
	&& apt clean \	
	&& rm -rf /var/lib/apt/lists/* 

RUN wget -O forgejo https://codeberg.org/forgejo/forgejo/releases/download/v1.19.3-0/forgejo-1.19.3-0-linux-amd64 \
	&& chmod +x forgejo \
	&& mkdir /app \
	&& mv forgejo /app/forgejo

COPY ./entrypoint.sh /entrypoint.sh

RUN useradd -m forgejo \
	&& usermod -aG forgejo forgejo \
	&& chown -R forgejo:forgejo /app \
	&& mkdir /app/data \
	&& chown -R forgejo:forgejo /app/data \
	&& mkdir /app/custom \
	&& chown -R forgejo:forgejo /app/custom \
	&& mkdir -p /app/custom/conf \
	&& chown -R forgejo:forgejo /app/custom/conf \
	&& mkdir /app/logs \
	&& chown -R forgejo:forgejo /app/logs

WORKDIR /app

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"] #may need to be refactored

CMD ["/app/forgejo", "web"]
