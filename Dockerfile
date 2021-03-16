FROM jenkins/jenkins

# Skip initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dfile.encoding=UTF8 -Dsun.jnu.encoding=UTF8"

COPY plugins.txt /usr/share/jenkins/plugins.txt

# ADD JOBS
COPY DEV.xml /usr/share/jenkins/ref/jobs/DEV/config.xml
COPY QA.xml /usr/share/jenkins/ref/jobs/QA/config.xml
COPY PROD.xml /usr/share/jenkins/ref/jobs/PROD/config.xml
#
COPY credentials.xml /usr/share/jenkins/ref/credentials.xml
# RUN JENKINS_UC_DOWNLOAD=http://mirrors.jenkins-ci.org jenkins-plugin-cli --verbose -f /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli --verbose -f /usr/share/jenkins/plugins.txt

ENV LANG=en_US.UTF-8

USER jenkins
