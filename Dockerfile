FROM jenkins:2.60.3
MAINTAINER Erokhin Dmitry <i9164871362@gmail.com>
USER root
RUN apt-get update && apt-get install -y python3 maven ansible
# RUN pip3 install 
USER jenkins
COPY .ssh /var/jenkins_home
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
EXPOSE 8080
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
