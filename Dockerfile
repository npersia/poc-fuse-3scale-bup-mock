FROM openshift3/mysql-55-rhel7
COPY post-init.sh ${CONTAINER_SCRIPTS_PATH}/
COPY bup.sql ${CONTAINER_SCRIPTS_PATH}/
