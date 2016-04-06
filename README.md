# Simple Docker Image of OSIAM

Sources of a docker image for OSIAM (https://github.com/osiam/osiam), that just includes the _auth-server_ and the _resource-server_.

This image is based on the Tomcat 8 image with JRE 8 (https://hub.docker.com/_/tomcat/), so all configuration options apply here, too.

## Prerequesits

* Postgresql Database (tested with 9.3)

## Preparations

You have to create a user and a database for OSIAM:

    CREATE USER osiam WITH PASSWORD 'osiam';
    CREATE DATABASE osiam;
    GRANT ALL PRIVILEGES ON DATABASE osiam TO osiam;

## Use the image

You can start it with

    docker run -d -p 8080:8080 --link my-postgresql-db:postgresql burberius/osiam-docker-simple:2.5

This assumes that your postgresql docker container uses the name _my-postgresql-db_ and links that to the osiam docker image.
