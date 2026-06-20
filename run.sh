#!/bin/bash
USER="${NEO4J_AUTH%/*}"
PASSWORD="${NEO4J_AUTH#*/}"
bin/neo4j-admin dbms set-initial-password $PASSWORD || true
#neo4j-admin database load neo4j --from-path=/import
bin/neo4j console --verbose