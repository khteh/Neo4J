FROM neo4j:latest
LABEL org.opencontainers.image.authors="Kok How, Teh <funcoolgeeek@gmail.com>"
RUN set -eux; \
    cp /var/lib/neo4j/labs/apoc-*-core.jar /var/lib/neo4j/plugins/; \
    cp /var/lib/neo4j/products/neo4j-graph-data-science-*.jar /var/lib/neo4j/plugins/; \
    chown -R neo4j:neo4j /var/lib/neo4j/plugins
# keep the official ENTRYPOINT/CMD: no overrides