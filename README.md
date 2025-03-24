# Neo4J

Restore a dump to default database

## Check Existing Databases

- To connect from BASH:

```
$ cypher-shell -a bolt://svc-neo4j-nodeport:7687
```

- To show databases:

```
neo4j@neo4j> show databases;
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| name     | type       | aliases | access       | address          | role      | writer | requestedStatus | currentStatus | statusMessage | default | home  | constituents |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| "neo4j"  | "standard" | []      | "read-write" | "localhost:7687" | "primary" | TRUE   | "online"        | "online"      | ""            | TRUE    | TRUE  | []           |
| "system" | "system"   | []      | "read-write" | "localhost:7687" | "primary" | TRUE   | "online"        | "online"      | ""            | FALSE   | FALSE | []           |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

2 rows
ready to start consuming query after 17 ms, results consumed after another 4 ms
```

- To show details of a database:

```
neo4j@neo4j> show database neo4j yield *;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| name    | type       | aliases | access       | databaseID                                                         | serverID                               | address          | role      | writer | requestedStatus | currentStatus | statusMessage | default | home | currentPrimariesCount | currentSecondariesCount | requestedPrimariesCount | requestedSecondariesCount | creationTime             | lastStartTime            | lastStopTime | store                | lastCommittedTxn | replicationLag | constituents | defaultLanguage | options |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| "neo4j" | "standard" | []      | "read-write" | "9549F64508BD2DD9D7561DB910D44316ED8D1EBEF2759BE27124DB58157A2F9E" | "cdef9ac7-8666-423f-8ddf-2a6ed00bb08a" | "localhost:7687" | "primary" | TRUE   | "online"        | "online"      | ""            | TRUE    | TRUE | 1                     | 0                       | NULL                    | NULL                      | 2025-03-24T11:15:25.901Z | 2025-03-24T11:15:25.901Z | NULL         | "record-aligned-1.1" | NULL             | 0              | []           | "CYPHER 5"      | {}      |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

1 row
ready to start consuming query after 292 ms, results consumed after another 7 ms
```

## To import CSV into the database:

- Need to copy the files / folder into the pod `/import/`

## Dump the selected database

(1) Go into the pod shell
(2) Stop neo4j

```
$ neo4j stop
```

(3) Run the dump

```
$ neo4j-admin database dump <database> --to-path=/import/
```

## Map the databases in postgresql.yml

```
            - name: POSTGRES_DB_1
              value: AspNetCoreWebApi
            - name: POSTGRES_DB_2
              value: library
            - name: POSTGRES_DB_3
              value: school
            - name: POSTGRES_DB_4
              value: LangchainCheckpoint
```
