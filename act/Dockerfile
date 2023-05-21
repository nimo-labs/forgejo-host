FROM debian:stable-slim
LABEL MAINTAINER="@Nick - Insert your details here"
LABEL description="Act is a tool that allows you to run GitHub Actions locally"

ARG ACT_RUNNER_HOME="/act_runner/"
ARG ACT_RUNNER_VERSION="0.1.8"
ARG USER="act_runner"
ARG PUID="1000"
ARG GUID="1000"

RUN echo "Preparing the image for Act Runner" \
	&& apt -y update && apt -y upgrade && apt -y install  \
		wget \
		bash \
		docker.io \
	&& apt-get clean \
    && apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

RUN echo "Creating user and group for Act Runner" \
	&& groupadd --gid ${GUID} ${USER} \
    && useradd --uid ${PUID} --gid ${GUID} ${USER} \
    && mkdir ${ACT_RUNNER_HOME} \
    && chown -R ${USER}:${USER} ${ACT_RUNNER_HOME}
WORKDIR ${ACT_RUNNER_HOME}

RUN echo "Installing Act Runner" \
	&& wget -o act_runner https://gitea.com/gitea/act_runner/releases/download/v${ACT_RUNNER_VERSION}/act_runner-${ACT_RUNNER_VERSION}-linux-amd64 \
	&& chmod +x act_runner \
	&& mv act_runner /usr/bin/act_runner

COPY entrypoint.sh ${ACT_RUNNER_HOME}/entrypoint.sh

ENTRYPOINT [ "/usr/bin/bash" "${ACT_RUNNER_HOME}entrypoint.sh" ]