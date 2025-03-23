#!/usr/bin/env bash
echo "Adding filmoteka keyspace"
cqlsh localhost -u cassandra -p cassandra -e "SOURCE '/scripts/create.cql';"
echo "added"
