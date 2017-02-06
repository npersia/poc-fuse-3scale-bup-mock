# Mock de BUP

[Openshift Mysql](https://docs.openshift.com/enterprise/3.1/using_images/db_images/mysql.html)

Servicio de base de datos mock para el _backend_ BUP.

## Stored Procedures

## Instalar en openshift

```
$ oc project <nombre proyecto>
$ oc new-app git@gitlab.semperti.local:hipotecario/poc-fuse-3scale-bup-mock.git --name bup
```

## Construir imagen localmente

```bash
$ docker pull registry.access.redhat.com/openshift3/mysql-55-rhel7
$ docker tag registry.access.redhat.com/openshift3/mysql-55-rhel7:latest openshift3/mysql-55-rhel7:latest
$ docker build -t bup .
```
