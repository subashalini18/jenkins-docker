FROM jenkins/jenkins:2.263.4-lts

USER root

RUN apt-get update 

RUN wget https://releases.hashicorp.com/terraform/0.14.5/terraform_0.14.5_linux_amd64.zip
RUN unzip terraform_0.14.5_linux_amd64.zip
RUN mv terraform /usr/bin/

RUN apt-get update && apt-get install -y net-tools

RUN usermod -aG sudo jenkins

USER jenkins
COPY jenkins_plugin.txt /usr/share/jenkins/ref/jenkins_plugin.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/jenkins_plugin.txt 
