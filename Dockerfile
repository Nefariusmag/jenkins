FROM jenkins:2.46.1
MAINTAINER Erokhin Dmitry <i9164871362@gmail.com>
USER root
RUN apt-get update && apt-get install -y ansible maven
USER jenkins
# COPY plugins.txt /plugins.txt
# RUN /usr/local/bin/plugins.sh /plugins.txt
EXPOSE 8080
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
#CMD ["/bin/bash"]
