# syntax=docker/dockerfile:1
FROM ubuntu:jammy

COPY setup.sh /
RUN chmod +x setup.sh
RUN ./setup.sh

EXPOSE 18080
EXPOSE 18081

VOLUME /root/.bitmonero

ENTRYPOINT ["./monerod"]
CMD ["--p2p-bind-ip=0.0.0.0", "--p2p-bind-port=18080", "--rpc-bind-ip=0.0.0.0", "--rpc-bind-port=18081", "--non-interactive", "--confirm-external-bind"]