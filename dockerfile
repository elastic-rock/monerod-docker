# syntax=docker/dockerfile:1
FROM ubuntu:jammy

COPY extract.sh /

RUN apt-get update && apt-get install -y wget bzip2

RUN wget https://downloads.getmonero.org/linux64

RUN chmod +x extract.sh
RUN ./extract.sh

EXPOSE 18080
EXPOSE 18081

VOLUME /root/.bitmonero

ENTRYPOINT ["./monerod"]
CMD ["--p2p-bind-ip=0.0.0.0", "--p2p-bind-port=18080", "--rpc-bind-ip=0.0.0.0", "--rpc-bind-port=18081", "--non-interactive", "--confirm-external-bind"]