FROM tomcat:7.0.81
MAINTAINER Yannis Marketakis

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

ADD Resources/*.tar.gz /usr/local/tomcat/webapps/

ADD entrypoint.sh /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
