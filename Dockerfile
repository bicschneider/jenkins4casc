FROM jenkins/jenkins:2.121.1
LABEL maintainer="man@praqma.net" 

ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

##### JENKINS SETUP. For alpha releases use the experimental update center
ENV JENKINS_HOME /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


