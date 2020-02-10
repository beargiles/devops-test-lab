= Cassandra (minimal)

This docker-compose file creates a minimal Cassandra instance.

Info: https://hub.docker.com/_/cassandra

To run CQLSH, e.g., to populate the database, use

```
$ docker run -it --rm cassandra cqlsh some.sql.command
```
