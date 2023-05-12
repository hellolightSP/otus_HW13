**Домашнее задание**

Docker, docker-compose, dockerfile

**Цель**

Разобраться с основами docker, с образом, эко системой docker в целом.


**Выполнение домашнего задания:**

- Скачиваем образ nginx
```
docker pull nginx

docker images -a
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
nginx                    latest    448a08f1d2f9   8 days ago       142MB
```
- Создаем Dockerfile и необходимые файлы для nginx
```
mkdir ./docker
cd ./docker
```
[Dockerfile](https://github.com/hellolightSP/otus_HW13/blob/main/Dockerfile)

[index3000.html](https://github.com/hellolightSP/otus_HW13/blob/main/index3000.html)

[index80.html](https://github.com/hellolightSP/otus_HW13/blob/main/index80.html)

[page1.conf](https://github.com/hellolightSP/otus_HW13/blob/main/page1.conf)

[page2.conf](https://github.com/hellolightSP/otus_HW13/blob/main/page2.conf)

- Собираем образ
```
docker build -t nginx/test .
```

- Добавиляем 2 вольюма. Один для логов приложения, другой для web-страниц.
```
docker volume create volume-log
docker volume create volume-web

docker volume ls
DRIVER    VOLUME NAME
local     volume-log
local     volume-web
```

- Запускаем контейнер из созданного образа
```
docker run -dt -p 80:80 -p 3000:3000 -v volume-log:/var/log/nginx -v volume-web:/var/html/ nginx/test

docker ps -a
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS                        PORTS                                                                          NAMES
e74959cdf9df   nginx/test   "/docker-entrypoint.…"   1 minutes ago    Up 1 minutes                  0.0.0.0:80->80/tcp, :::80->80/tcp, 0.0.0.0:3000->3000/tcp, :::3000->3000/tcp   funny_saha
```

- Проверяем доступность страниц на 80 и 3000 портах
```
root@neon-desktop:/test_vm/docker# curl localhost:80
<!DOCTYPE html>
<html>
<body>

<h1>My First Heading 80</h1>
<p>My first paragraph.</p>

</body>
</html>


root@neon-desktop:/test_vm/docker# curl localhost:3000
<!DOCTYPE html>
<html>
<body>

<h1>My First Heading 3000</h1>
<p>My first paragraph.</p>

</body>
</html>
```

- Добавляем наш образ на dockerhub
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

- Образ доступен по ссылке
https://hub.docker.com/r/hellolightsp/otus_hw13/tags
