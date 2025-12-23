#!/bin/bash
#docker build -t khteh/neo4j . --build-arg NEO4J_AUTH='neo4j/P@$$w0rd'
docker build -t khteh/neo4j . --no-cache
docker push khteh/neo4j:latest
