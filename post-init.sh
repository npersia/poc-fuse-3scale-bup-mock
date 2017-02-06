#! /bin/bash

source ${CONTAINER_SCRIPTS_PATH}/common.sh

mysql=( mysql $admin_flags)

for f in ${CONTAINER_SCRIPTS_PATH}/*; do
    case "$f" in
        *.sql)    echo "$0: running $f"; "${mysql[@]}" < "$f"; echo ;;
        *.sql.gz) echo "$0: running $f"; gunzip -c "$f" | "${mysql[@]}"; echo ;;
    esac
    echo
done
