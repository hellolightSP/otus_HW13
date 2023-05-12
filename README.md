**Домашнее задание**

Docker, docker-compose, dockerfile

**Цель**
Разобраться с основами docker, с образом, эко системой docker в целом.


**Выполнение домашнего задания:**


docker volume create volume-log
docker volume create volume-web
```
docker volume ls
DRIVER    VOLUME NAME
local     volume-log
local     volume-web
```
docker run -dt -p 80:80 -p 3000:3000 nginx/test --mount source=volume-log,destination=/var/log/nginx --mount source=volume-web,destination=/var/html/
```
docker ps -a
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS                        PORTS                                                                          NAMES
e74959cdf9df   nginx/test   "/docker-entrypoint.…"   1 minutes ago    Up 1 minutes                  0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   funny_saha
```
```
docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: hellolightsp
Password: 
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded

docker image tag nginx/test hellolightsp/otus_hw13
docker push hellolightsp/otus_hw13
Using default tag: latest
The push refers to repository [docker.io/hellolightsp/otus_hw13]
88017614e5f4: Pushed 
ef2150c376ad: Pushed 
0589b82f2748: Pushed 
8ea14f2e23a3: Pushed 
a259385b1dfe: Pushed 
5a89a9eb8100: Pushed 
b23759a750a2: Pushed 
1040838fe30e: Mounted from library/nginx 
93ee76f39c97: Mounted from library/nginx 
5684be535bf1: Mounted from library/nginx 
6bc8ae8fb3cf: Mounted from library/nginx 
a29cc9587af6: Mounted from library/nginx 
8553b91047da: Mounted from library/nginx 
latest: digest: sha256:b18b8eab5004c6025b68b1577c0436573788fe894b584f060890a4a03d812ebe size: 3024
```
https://hub.docker.com/r/hellolightsp/otus_hw13/tags
