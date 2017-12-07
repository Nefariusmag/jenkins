FROM jenkins:2.60.3
MAINTAINER Erokhin Dmitry <i9164871362@gmail.com>
USER root
# установка нужных программ для работы
RUN apt-get update -y && apt-get install -y python3 python3-pip zip sudo sshpass git python-pip curl php
RUN pip3 install ansible pysphere pywinrm psycopg2
RUN pip install pysphere
# прокидывание ключей для root
RUN mkdir /root/.ssh
COPY ssh_root/* /root/.ssh/
# Настройка сетевых правил
COPY ssh_config /etc/ssh/ssh_config
# выдача sudo прав jenkins
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
# # Инсталяция java и maven для ГИСТЭК
RUN wget -q http://distr-repo-i.gistek.lanit.ru/repo/3rd-party/oracle/jdk/1.8/install_java8_bin.sh -O /opt/install_java8_bin.sh
RUN chmod +x /opt/install_java8_bin.sh && /opt/install_java8_bin.sh
# RUN wget -q http://distr-repo-i.gistek.lanit.ru/repo/3rd-party/apache/maven/3.5.0/apache-maven-3.5.0-bin.tar.gz -O /opt/apache-maven-3.5.0-bin.tar.gz
# RUN cd /opt && tar xzvf /opt/apache-maven-3.5.0-bin.tar.gz && ln -s /opt/apache-maven-3.5.0 maven
# RUN echo "PATH=$PATH:/opt/apache-maven-3.5.0/bin" >> /etc/profile.d/01_jdk8.sh
# RUN wget -q http://distr-repo-i.gistek.lanit.ru/repo/3rd-party/apache/maven/maven_repository.zip -O /home/jenkins/.m2/maven_repository.zip
# RUN cd /home/jenkins/.m2/ && unzip maven_repository.zip
RUN wget -q https://github.com/sbt/sbt/releases/download/v1.0.2/sbt-1.0.2.tgz -O /opt/sbt-1.0.2.tgz
RUN cd /opt && tar xzf sbt-1.0.2.tgz
# установка плагинов для jenkins
COPY plugins.txt /plugins.txt
RUN /usr/local/bin/plugins.sh /plugins.txt
# прокидывание ключей для jenkins
USER jenkins
RUN mkdir /var/jenkins_home/.ssh
COPY ssh_jenkins/* /var/jenkins_home/.ssh/
# настройка общих параметров и запуск приложения
VOLUME ["/var/jenkins_home"]
EXPOSE 8080
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
