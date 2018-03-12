# pgssl
Docker postgres with ssl

## Installation

```bash
# download image
docker pull gritcode/pgssl
# run docker container
docker run \
--name pgssl \
-e POSTGRES_PASSWORD=postgres \
-p 5432:5432 \
-d pgssl postgres -l
# psql
docker run -it --rm --link db:postgres postgres psql -h postgres -U postgres
# create database
postgres› CREATE DATABASE mydb;
# list databases
postgres› \l
# Using psql, import sql file (brew install postgres)
psql -h localhost -U postgres -f mydump.sql
# or
psql mydb < mydump.sql
```

## Development

```bash
# create certs
cd docker-entrypoint-initdb.d
openssl req -x509 \
-nodes \
-days 3650 \
-subj "/C=AU/ST=Queensland/L=Brisbane/O=Gritcode/CN=server" \
-newkey rsa:2048 \
-keyout server.key -out \
server.crt
# build image
docker build . --tag pgssl
# run docker container
docker run \
--name pgssl \
-e POSTGRES_PASSWORD=postgres \
-p 5432:5432 \
-d pgssl postgres -l
# commit
docker commit -m "Initial commit" -a "Ben Cooling <ben@optizmo.com>" pgssl gritcode/pgssl:1.0.0
```
