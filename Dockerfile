FROM neo4j:latest
LABEL org.opencontainers.image.authors="Kok How, Teh <funcoolgeeek@gmail.com>"
VOLUME /data
RUN cp /var/lib/neo4j/labs/apoc-* /var/lib/neo4j/plugins
ADD run.sh /usr/local/bin/run.sh
EXPOSE 7687 7473 7474
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["bash"]