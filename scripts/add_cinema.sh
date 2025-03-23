#!/usr/bin/env bash

cqlsh localhost -u cassandra -p cassandra -e "SOURCE '/scripts/cinema.cql';"