FROM ubuntu:rolling

RUN apt update && apt -y install\
	git\
	&& rm -rf /var/lib/apt/lists/* 

RUN mkdir /app
COPY ./forgejo-1.19.3-0-linux-amd64 /app/forgejo
RUN chmod +x /app/forgejo
COPY ./entrypoint.sh /

RUN useradd -m forgejo
RUN usermod -aG forgejo forgejo

RUN chown -R forgejo:forgejo /app


RUN mkdir /app/data
WORKDIR /app

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]

CMD ["/app/forgejo", "web"]
