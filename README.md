Files

file/ - файлы готовго дженкинса
README.md

Setup

cd /opt
git clone git@github.com:Nefariusmag/jenkins.git jenkins
docker run --name jenkins -d -p 8000:8080 -v /opt/jenkins/file:/var/jenkins_home nefariusmag/jenkins:1.3

Then go to http://localhost:8000/ and log in as jenkins, password: changeme

Jenkins ver. 2.46.1

Plugins:

Ansible plugin - 0.6.2
AnsiColor - 0.5.0
Ant Plugin - 1.4
bouncycastle API Plugin - 2.16.0
built-on-column - 1.1
Conditional BuildStep - 1.3.5
Credentials Plugin - 2.1.13
Display URL API - 1.1.1
Environment Injector Plugin - 1.93.1
External Monitor Job Type Plugin - 1.7
Folders Plugin - 6.0.3
Git client plugin - 2.4.0
Git Parameter Plug-In - 0.8.0
Git plugin - 3.2.0
Icon Shim Plugin - 2.0.3
Javadoc Plugin - 1.4
jQuery plugin - 1.11.2-0
JUnit Plugin - 1.20
LDAP Plugin - 1.14
Mailer Plugin - 1.20
Mask Passwords Plugin - 2.9
Matrix Authorization Strategy Plugin - 1.4
Matrix Project Plugin - 1.9
Maven Integration plugin - 2.15.1
Multijob plugin - 1.24
OWASP Markup Formatter Plugin - 1.5
PAM Authentication plugin - 1.3
Parameterized Scheduler - 0.3.1
Parameterized Trigger plugin - 2.33
Pipeline: API - 2.12
Pipeline: Basic Steps - 2.4
Pipeline: SCM Step - 2.4
Pipeline: Step API - 2.9
Rebuilder - 1.25
Resource Disposer Plugin - 0.6
Run Condition Plugin - 1.0
SCM API Plugin - 2.1.1
Script Security Plugin - 1.27
SSH Credentials Plugin - 1.13
Structs Plugin - 1.6
Token Macro Plugin - 2.0
Windows Slaves Plugin - 1.3.1
Workspace Cleanup Plugin  - 0.32

History

---1.3
jenkins обновлен - ver. 2.46.1

Обновлены все плагины

---1.2
Добавил плагин: 	
Git Parameter Plug-In - 0.7.2

Обновил существующие плагины:
Matrix Project Plugin - 1.8
Git client plugin - 2.2.1
Resource Disposer Plugin - 0.6
LDAP Plugin - 1.14

---1.1
Добавил ansible (1.7.2) и maven (3.0.5) в контейнер

---1.0
Стартовый комит.

В папке file сейчас лежит собраный дженкис со всеми часто используемыми мною плагинами.