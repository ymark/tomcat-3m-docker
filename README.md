# README #

The repository contains the necessary resources that are required for creating a docker image for apache tomcat with the 
required webapps and resources for working with 3M.

The image is build upon the docker image for tomcat from [tomcat](https://hub.docker.com/r/library/tomcat/)

## Apache Tomcat

Apache Tomcat is an open source implementation of the Java Servlet and JavaServer Pages technologies
More information about Apache Tomcat are available at http://tomcat.apache.org

## 3M

The 3M is a web application suite containing several software sub-components and exploiting several external services.
Its main functionality is to assist users during the mapping definition process, using a human-friendly user interface and a set of sub-components that either suggest or validate the user input.
More information about 3M and its related components can be found at http://www.ics.forth.gr/isl/X3MLToolkit

## How to use

### Prerequisites 

The image requires that [marketak/existdb-3m](https://hub.docker.com/r/marketak/existdb-3m/) container is up and running in the same external IP address (i.e. run docker images from the same virtual machine so that they share the same IP address). 

The image creates a running instance of Apache Tomcat, with the required 3M  webapps and resources allready shipped in, so that it can work as the underlying layer of 3M framework. The container starts tomcat container and listens for incoming connection at port 8080. The following environment variables are available for managing the apache tomcat container:

* IP_ADDRESS: allows the user defining the IP address (the external one) where docker is running. This will allow configuring 3M web applications with the proper external IP address they are available into. If the variable is not set when running the container, then the default IP address will be used (localhost)

To start your container binding to port 8080 using the external IP address 123.123.123.123: 

```
docker run -d -p 8080:8080 -e IP_ADDRESS=123.123.123.123 marketak/tomcat-3m:latest
```

After running the container you can check if the instance is up and running by pasting the link below in your web browser

```
http://123.123.123.123:8080
```

### Maintainers

Yannis Marketakis (marketak 'at' ics 'dot' forth 'dot' gr)
