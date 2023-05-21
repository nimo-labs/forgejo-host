FROM ubuntu:rolling AS BUILDER

RUN apt -y update

RUN apt -y update && apt -y upgrade && apt -y install\
	make\
	wget\
	git\
	golang\
	docker.io \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /

# ENV PATH=$PATH:/usr/local/go/bin

# RUN wget https://go.dev/dl/go1.20.4.linux-armv6l.tar.gz
# RUN  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.20.4.linux-armv6l.tar.gz

#RUN rm -f go1.20.4.linux-amd64.tar.gz

RUN git clone https://gitea.com/gitea/act_runner.git
WORKDIR act_runner
RUN make build

COPY entrypoint.sh .

CMD ./entrypoint.sh
