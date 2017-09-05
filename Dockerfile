FROM registry.access.redhat.com/openshift3/mysql-55-rhel7
#FROM openshift3/mysql-55-rhel7
ENV MYSQL_USER bup
ENV MYSQL_PASSWORD bup
ENV MYSQL_DATABASE bup
COPY post-init.sh ${CONTAINER_SCRIPTS_PATH}/
COPY bup.sql ${CONTAINER_SCRIPTS_PATH}/
