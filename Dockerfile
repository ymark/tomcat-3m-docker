FROM tomcat:7.0.81

LABEL image.maintainer="Yannis Marketakis" \
	image.organization="FORTH-ICS" \
	image.version="1.0" \
	image.lastupdate="2017-10-20" \
	image.description="apache tomcat image with 3M resources"

ENV CATALINA_HOME /usr/local/tomcat

ENV PATH $CATALINA_HOME/bin:$PATH

ADD Resources/*.tar.gz /usr/local/tomcat/webapps/

ADD entrypoint.sh /entrypoint.sh

EXPOSE 8080

VOLUME ["/usr/local/tomcat"]

ENTRYPOINT ["/entrypoint.sh"]
