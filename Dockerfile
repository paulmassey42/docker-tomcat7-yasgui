# SYSTEM
#
# VERSION				0.0.1

# Use the lastest version of ubuntu 
FROM tutum/tomcat:7.0
MAINTAINER pma
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install mysql-server
RUN apt-get -y install maven
RUN apt-get -y install git
RUN git clone http://github.com/LaurensRietveld/yasgui
RUN cd yasgui && mvn package 
RUN mv /yasgui/target/yasgui-13.*.war /tomcat/webapps/yasgui.war
# COPY config.json /tomcat/webapps/yasgui
