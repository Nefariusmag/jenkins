Info:

Jenkins ver. 2.89.3
Plugins in plugins.txt

Files:

Dockerfile
docker-compose.yml
README.md
plugins.txt - version of plugins for jenkins
requirements.txt - version for apps for install from pip
ssh_config
jenkins_home/

Setup:

CentOS:
sudo yum install docker epel-release python-pip -y
sudo pip install docker-compose

Clone git repo
```
git clone git@github.com:Nefariusmag/jenkins.git && cd jenkins
chown -R 1000 jenkins_home
docker-compose up -d
```

Then go to http://localhost/.

History:

---2.4.0

Сохраняю стартовые конфигурации в jenkins_home, чтобы не надо было настраивать jenkins c нуля

---2.1.0

Добавил установку предварительно плагинов.

---2.0.0

Стартовый комит.
