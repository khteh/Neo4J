FROM neo4j:latest
VOLUME /data
ARG NEO4J_AUTH
ARG user="${NEO4J_AUTH%/*}"
ARG password="${NEO4J_AUTH#*/}"
ENV USER $user
ENV PASSWORD $password
RUN echo USER: $USER PASSWORD: $PASSWORD
CMD bin/neo4j-admin dbms set-initial-password $PASSWORD || true && \
    neo4j-admin database load neo4j --from-path=/import && \
    bin/neo4j start && sleep 5 && \
    tail -f logs/neo4j.log