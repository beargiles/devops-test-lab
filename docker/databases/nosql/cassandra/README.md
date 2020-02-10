# Cassandra (minimal)

This docker-compose file creates a minimal Cassandra instance.

Info: https://hub.docker.com/_/cassandra

To run CQLSH, e.g., to populate the database, use

```
$ docker exec -it cassandra cqlsh
```

where `cassandra` is the name of the container.


## Useful commands

List keyspaces (schemas)

```
SELECT * FROM system.schema_keyspaces;   -- 5.0.x
SELECT * FROM system_schema.keyspaces;   -- 6.0
```

List tables

```
SELECT * FROM system_schema.tables WHERE keyspace_name = 'keyspace_name';
```

List table info

```
SELECT * FROM system_schema.columns
  WHERE keyspace_name = 'keyspace_name'
    AND table_name = 'table_name';
```

