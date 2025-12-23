FROM neo4j:latest
LABEL org.opencontainers.image.authors="Kok How, Teh <funcoolgeeek@gmail.com>"
VOLUME /data
ADD run.sh /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["bash"]