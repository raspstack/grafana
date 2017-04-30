FROM raspstack/raspbian:jessie

RUN apt-get update -y && \
    apt-get -y --no-install-recommends install libfontconfig wget ca-certificates && \
    wget https://github.com/fg2it/grafana-on-raspberry/releases/download/v4.2.0/grafana_4.2.0_armhf.deb && \
    dpkg -i grafana_4.2.0_armhf.deb && \
    rm -rf grafana_4.2.0_armhf.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./run.sh /run.sh 

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

WORKDIR "/"

CMD ["./run.sh"]

