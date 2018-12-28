From tomcat:8-jre8

# Maintainer
MAINTAINER "sasdevops"

# copy war file on to container
COPY ./webapp.war /usr/local/tomcat/webapps