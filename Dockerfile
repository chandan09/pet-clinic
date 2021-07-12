FROM tomcat:10
# Take the war and copy to webapps of tomcat
CMD mkdir /mnt/artefact
COPY /var/lib/jenkins/workspace/jenkins-pipeline/target/*.war /mnt/artefact/petclinic.war
COPY /mnt/artefact/*.war /usr/local/tomcat/webapps/petclinic.war
