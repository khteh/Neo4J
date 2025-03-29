FROM neo4j:latest
VOLUME /data
ARG NEO4J_AUTH
ARG user="${NEO4J_AUTH%/*}"
ARG password="${NEO4J_AUTH#*/}"
ENV USER $user
ENV PASSWORD $password
CMD cp labs/apoc-2025.02.0-core.jar plugins/ && \
    bin/neo4j-admin dbms set-initial-password $PASSWORD || true && \
    #neo4j-admin database load neo4j --from-path=/import && \
    bin/neo4j start --verbose && sleep 5 && \
    tail -f /var/log/neo4j/neo4j.log