FROM jenkins:2.60.3
MAINTAINER Erokhin Dmitry <i9164871362@gmail.com>
USER root
RUN apt-get update && apt-get install -y python3 maven python3-pip
RUN pip3 install ansible
USER jenkins
RUN mkdir /var/jenkins_home/.ssh
COPY .ssh/* /var/jenkins_home/.ssh/
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
# RUN /usr/local/bin/install-plugins.sh /plugins.txt
EXPOSE 8080
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
