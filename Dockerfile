FROM jenkins:2.60.3
MAINTAINER Erokhin Dmitry <i9164871362@gmail.com>
USER root
RUN apt-get update && apt-get install -y python3 python3-pip zip sudo
RUN pip3 install ansible pysphere pywinrm psycopg2 
RUN mkdir /root/.ssh
COPY files/.ssh_root/* /root/.ssh/
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
RUN mkdir /var/jenkins_home/.ssh
COPY files/.ssh_jenkins/* /var/jenkins_home/.ssh/
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
# Инсталяция java и maven для ГИСТЭК

RUN mkdir /opt/dir
###
COPY files/install_java8_bin.sh /opt/install_java8_bin.sh
RUN chmod +x /opt/install_java8_bin.sh && /opt/install_java8_bin.sh
###
COPY files/apache-maven-3.5.0-bin.tar.gz /opt/apache-maven-3.5.0-bin.tar.gz
RUN cd /opt && tar xzvf apache-maven-3.5.0-bin.tar.gz
RUN echo "PATH=$PATH:/opt/apache-maven-3.5.0/bin" >> /etc/profile.d/01_jdk8.sh
COPY files/settings.xml /home/jenkins/.m2/settings.xml
COPY files/maven_repository.zip /home/jenkins/.m2/
EXPOSE 8080
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
