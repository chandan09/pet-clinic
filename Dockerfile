FROM tomcat:10
# Take the war and copy to webapps of tomcat
CMD mkdir /mnt/artefact/
COPY target/*.war /mnt/artefact/petclinic.war
