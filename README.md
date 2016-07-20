# Docker OpenDJ Rest To Ldap Gateway

Demo of [OpenDJ Rest To Ldap Gateway](https://forgerock.org/opendj/) product through Docker

## Demo

```
make install
```

```
curl -u abarnes:chevron http://`docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dockeropendjexample_tomcat_1`:8080/rest2ldap/users/abergin
curl -u abarnes:chevron http://`docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' dockeropendjexample_tomcat_1`:8080/rest2ldap/groups/HR%20Managers
```

## Usages

```
make
```
