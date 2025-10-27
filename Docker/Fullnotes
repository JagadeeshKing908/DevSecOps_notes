Docker : Docker is an open-source platform that uses containers to package applications with their dependencies. 
Containers are lightweight, portable, and run consistently across environments. Unlike virtual machines, they share the host OS, making them 
faster and more efficient. Docker ensures easy deployment, scalability, and eliminates the “works on my machine” problem.

components:-

1)images
2)containers
3)volumes
4)N/w.

Monolithic: It is a service that in an appalication all the services run on only a single server if we stop one server then all the services will be stoped.

database---->server1
app------>sever1

microservices: It is a service that single service will be running on single server

database---->serve1
app------>sever2

containerization -->it is the process of packing an appalication with its dependencies.

Docker ---> It is tool to manage containers.

container --->it is same like vm's it will not have operating system

images---> appalication + dependencies Ex:- image = war+java+tomcat+mysql

dockerhub -->is docker code management like github


commands:

To check list images--->docker images

To pull images from docker hub-->docker pull ubuntu

To create containers -->docker run -itd --name jagadeesh centos

To see the image is created or not ---> docker ps

--------------------------------------------------------------
docker run -itd --name jagadeesh -p 8080:8081 tomcat

SIGMA RULE :-- IMAGE  RUN CONTAINER create

itd -- interactive terminal demon
p -->publish port

8080-->host port any thing we can take
8081-->container port depands on image


Day-2
-----

To switch into specific container ----> docker exec -it cont1 bash
To exit --->exit
To stop ---> dcoker  stop cont1 cont2 etc  --->docker kill cont1
to see running containers --->docker ps
to see the full info about container -->docker inspect cont1
To see all  containers --->docker ps -a
To see stopped containers only ----> docker ps -a -f "status=stopped"
To start containers --->docker start cont1 cont2
To Start all containers ---> docker start $(docker ps -a)
To stop running  docker containers --> docker stop $(docker ps)

kill :
It takes less time to stop as compared to docker stop.  
kill --->sigkill -->stop
Stop:
It takes more time to stop as compared to docker kill.  
stop --->sigterm--->10sec-->stop

remove:
 docker kill cont3
 dock rm cont3
 
 forcefully-->docker rm -f cont3
 
-->to rmove all containers --> docker rm $(docker ps -a)
--> to remove images---> docker rmi ubuntu centos:latest(tags) etc


--->To create image from container-->docker commit cont1 image1
--->To rename container--->docker rename cont1 cont11111
docker ps -a --filter "ancestor=nginx"




Day-3:
------

To build docker file--->docker build -t image1:V1  .

Here -t -->for tags
V1 --->VERSION
image name-->image1
Path of directory--> .


To remove all stopped containers --->docker container prune

-----------------------------------------------------------------------------------------------------

If we create an image with same name then the previous image gets override and previous goes to <none> state this technically we call it as dangling images

If we want to remove dangling images ---->docker image prune

Day-4:
------

1)ngnix -->/usr/share/ngnix/html/        

javaapp

2)tomcat -->/usr/local/tomcat/webapp/ --->one

nodejs app -->nodejs docker

vim Dockerfile                                   for run and build node js app ------>npm build
                                                                                      npm test
																					  npm install
FROM node:16
WORKDIR  /myapp
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node","index.js"]

																					  																					  node index.js
docker build -t nodeapp .
docker run -itd --name cont2 -p  7777:80 nodeapp

1)Multi stage Docker file : By providing input of one stage of docker file to second stage we call it as multistage docker file -->it should be done by removing cache
2)It is mainly for image size reduction


FROM node:19-alpine AS stageone
WORKDIR  /myapp
COPY package*.json ./
RUN npm install
COPY . .

FROM stageone AS finalstage
RUN npm install --production   (-- Prodution is to remove dependencies for second time)
COPY . .
CMD ["node","index.js"]

																					  																					  node index.js
docker build -t nodeapp .
docker run -itd --name cont2 -p  7777:80 nodeapp


Database :

vim Dockerfile

FROM mysql/mysql-server:5.7
EXPOSE 3306
ENV MYSQL_USER=root
ENV MYSQL_ROOT_PASSWORD=123


docker build -t mydb .
docker run -d --name db mydb
docker exec -it mydb bash
mysql -u root -p


show databases;
craete database flm;
use flm;
show tables;



Day-5:
-----

Volumes: Volumes are used to replicate the data b/w the multiple containers.

mount -->attching the volume to specific path

container to volume Replication:
--------------------------------

Creating files inside the container and check it in the volume path /var/lib/docker/

creating files inside volume and check that in the container on mounting directory.

Replication in docker:-- (Data replication)
--------------------

creating the docker volume --->docker run -itd --name cont1 -v /devops ubuntu

replication in docker--->docker run -itd --name cont2 --privileged=true --volumes-from=cont1 ubuntu 

From above we are naming a container to cont2 and giving previleges as true from cont1

*** create and delete some files and check whethr these are woring or  not.

Volumes:-
------

To create volumes : docker volume create vishnu

To check --->  docker volume ls

Add some data in volume--->touch /var/lib/docker/myfile{1..10}.txt

To mount for a container --->docker run -itd  --name cont1 --mount src=vishnu,destination=/frontlinesmedia ubuntu

	
To mount for a container --->docker run -itd --name cont2 --mount src=vishnu,destination=/frontlinesmedia ubuntu

check the files exist or not-->

To remove volumes-->docker volume rm vishnu

To remove all the  volumes :-->docker voulme rm $(docker volume ls)



Project:-
--------

command mode of creation docker file:

docker volume create swiggy

cd /var/lib/docker/volumes/swiggy/_data/ -->vim index.html

docker run -itd --name cont1 -p 1111:80 --mount src=swiggy destination=/usr/share/ngnix/html ngnix

Acces it with publi ip --->ip:1111

docker run -itd --name cont2 -p 2222:80 --mount src=swiggy,destination=/usr/share/ngnix/html ngnix

Acces it with publi ip --->ip:2222

update data in volume then it will reflect on containers.


With docker file :--
----------------------

vim Dockerfile

FROM httpd
VOLUME "[/usr/local/apache/htdocs/"]


build--->docker build -t image1 .

docker run -itd --name cont6 -p 6666:80 image1

access -->ip:6666



vim Dockerfile

FROM ngnix
VOLUME "[/usr/share/ngnix/html/]"


build--->docker build -t image1 .

docker run -itd --name cont7 -p 7777:80 image1

access -->ip:6666

To check history of docker --->docker inspect cont7

cd /var/lib/docker/volumes/volume_id/_data/ --->vim index.html -->h1 tag change


Host to container replication:  we are replicating data with out creating containers.
----------------------------

mkdir zomato

cd zomato --> touch index.html --><h1> hi welocme to html</h1>

docker -itd --name cont1 -p 1234:80 -v "$(pwd)":/usr/share/ngnix/html/ ngnix


Real time scenarios:
-------------------

1) for container to volume replication if we delete data on conatiner the automatically the data inside the volume also gets deleted how can you prevent it?

Ans:
----
By giving read only pemissions to conatainer we can prevent it.

practical :

docker volume create niharika

docker run -itd --name cont11 --mount src=niharika,destination=/devops,readonly  ubuntu

Add a file in conatiner --> and remove it in container. --> and verify it.

docker run -itd --name cont22 -v uber:myapp,ro ubuntu


Day-6:-
-------

Docker registery :- It is repository to store the images.  Images --> store -->registry

we have two types of registries.

cloud : + scan images
------         

Docker hub
AWS--->ECR -->elastic cloud registry
Azure -->ACR -->Azure cloud registry
GCR --->Google cloud registry

local:
------
NEXUS
JFROG
DTR -->docker trusted registries.

docker hub signup

create an image -->build it

docker build -t jagadeesh9088/firstrepo:ngnix

docker hub login--->docker login

username: -- passwd: --

docker push  jagadeesh9088/firstrepo:ngnix



AWS--->ECR -->elastic cloud registry :-
------------------------------------

1)We need to attach IAM role

2)action -->security-->modify IAM-->

3)aws cli installed on the server

4)Search ECR --->create repository ------>Name---> create --->into repo---> paste cmnds-->


Day-7:
------

Docker networks:--
----------------

There four types of networks by default.
1)bridged :
2)host
3)none
4)custom

custom network :If we create any custom network it will start by default 172.18.0.2

To create docker network -->dcoker network create instamart 
To check networks--->docker network ls
To create container with network --->docker run -itd --name cont1 -p 3333:80 --network instamart nginx

To check it is created with instamart network ---> docker inspect cont1

To remove network ----> docker network rm instamart (we cannot remove network forcefully)

To know full info about network --->docker network inspect instamart.

To remove unused networks --->docker network prune.

If we want to connect networks with two different on same host :
---------------------------------------------------------------

1)Create two containers with different networks .
2)install -->apt update -y; apt install iputils-ping -y

If we want connect with them internally

docker network connect frontend cont1
docker network connect backend cont2


check with --->docker inspect cont1

log on to container and ping. 

To rename a container -->docker rename cont1 jagadeesh
To change the given ports --> systemctl stop docker;first stop container ---> and goto /var/lib/docker/container/ -->vim hostconfig.json -->change port-->systemctl reload demon-->start docker

To limit containers:--
--------------------

To set limit the container ram and cpu's--->docker run -itd --name cont1 --cpus="0.25" --memory=250 ngnix

To check -->docker inspect |egrep -i "cpu ,memory"

Day-8:
------

Docker swarm:-- It is an orcherstration tool (group of server)
-------------
It is used to run multiple appalication on group of servers. In Docker swarm we need to create a service ---> service will create containers.
It has replication and scaling (
Replication : If one container got deleted same no of containers got created 
Scaling :- It is like increasing and decreasing of container count accroding to load
scalein:--Increasing of container count
scale out --> Decreasing of container count.
 
It has two types of nodes.
1)Master node -->It is responsible for running app.
2) worker node.--> It is where the actual app running

Here we will create clusters.

1)To create cluster -->docker swarm init -->And paste given cmnd in worker nodes
2)To create container ---->docker service create --name flm --publish 8081:80 --replicas 3 shaikmustafa/paytm:movie

Here 1 container will be created in manager and other 2 will be in worker nodes.

3)To check --->(docker service ps flm )docker service ls -->worker node-( docker ps)


4)To remove --->docker service rm flm

5)To scale up or down -->docker service scale devops=1

6)To update Image -->docker service update --image shaikmustafa/bus devops (change the image from older and update it with other images .It needs to avaliable in dockerhub)
  To update Image -->docker service update --image shaikmustafa/cycle devops
  To update Image -->docker service update --image shaikmustafa/dm devops

7)To Roll back -->docker service rollback devops (It wil roll back step by step --->It is draw back in docker here the kubernetes came)) (cycle -->dm -->dm-->cycle)

8)If we create an image locally then all containers will create in master node only because the images does not locally present in all servers.

9)To inspect --->docker service inspect devops


docker node management :--
------------------------

To add servers ---> give command while initilizing docker 

To check cluster servers -->docker node ls

To remove one server from docker cluster -->docker swarm leave (In worker node) It will show down in master

To remove from master ---> docker node rm idofserver

To add workers into the cluster --->docker swarm join-token worker 

To add workers into the cluster--->docker swarm join-token manager

we will get one extera network in swarm check --->docker network ls



Day-9 :--  
--------

Docker swarm:-->Used to run an appalication on multiple servers by creating orcherstration
	

Docker compose :-->Used to create multiple services and run an app on single servers.

swarm +compose = stack

In compose we use yaml file to create multiple containers at a time .
--------------------------------------------------------------------

1) Install it from all setups in git hub

Naming convention.

compose.yml
compose.yaml
docker-compose.yml
docker_compose.yaml

vim compose.yml

---

version: "3"
services:
  instamart:
    container_name: instamart
    image: shaikmustafa/dm
    ports:
      - "8081:80"
	
  food_delivary:
     container_name: food_delivary
	 image: shaikmustafa/cycle
	 ports: 
	   - "8082:80"
	   
  dineout:
    container_name: dineout
	image: shaikmustafa/cycle
	ports:
	  - "8083:3000"
	  
Project type :------
----------------------

mkdir instamart swiggy dineout 
cd instamart/

vim index.html
<h1> welcome to instamart </h1>
vim Dockerfile
FROM nginx
COPY . /usr/share/nginx/html/

copy all these to instamart and dineout and modify accrodingly

cd  swiggy

vim index.html
<h1> welcome to swiggy </h1>
vim Dockerfile
FROM nginx
COPY . /usr/share/nginx/html/

cd dineout

vim index.html
<h1> welcome to dineout </h1>
vim Dockerfile
FROM nginx
COPY . /usr/share/nginx/html/


build each and every image accrodingly

docker build -t swiggy-image swiggy
docker build -t instamart-image instamart
docker build -i dineout-image dineout

version: "3"
services:
  instamart:
    container_name: instamart
    image: instamart-image
    ports:
      - "8081:80"
	
  food_delivary:
     container_name: food_delivary
	 image: swiggy-image
	 ports: 
	   - "8082:80"
	   
  dineout:
    container_name: dineout
	image: dineout-image
	ports:
	  - "8083:80"


--->docker compose up -d (If changes has made in code then build image again--->and build it up again -->we shoud not use this process because if we many services then we need to build
      it for 10 times. we will use the below process.

version: "3"
services:
  instamart:
    container_name: instamart
    build: ./instamart/
    ports:
      - "8081:80"
	
  food_delivary:
     container_name: food_delivary
	 image: ./swiggy/
	 ports: 
	   - "8082:80"
	   
  dineout:
    container_name: dineout
	image: ./dineout/
	ports:
	  - "8083:80"
	  
----> docker-compose build -->if we give this command docker images will be created automatically whatever the no of services.
     --->we will not give any names here names will automatically created -->(	root_food_delivary)
---->To run this file --> docker-compose up -d


To run this file --> docker-compose up -d
d- detach
To down and delete as well --->docker-compose down

To build 100's of docker files--> docker-compose build

To stop containers in docker -->docker-compose stop

To start containers in docker--->docker-compose start

To pause containers-->docker-compose pause

To unpause containers-->docker-compose unpause

to login info about container--->docker-compose logs

To see config --> docker-compose config

Day-10:-
------

In docker swarm,compose , stack only app replication will work no database replications because there will some database conflicts if two persons will work on same 
database then there will be a conflicts.

   
vim compose.yml

---

version: "3"
services:
  instamart:
    build: image1
	deploy:
	  replicas: 3
    ports:
      - "8081-8083:80"
	
  food_delivary:
     build: image2
	 ports: 
	   - "8084-8086:80"

--->Note : In the above we haven't given the container name it will create container name automatically .And also port numbers as well if we will not give it will auto assign them as
 well	   
	   
To check version -----> compose version

Load balancers :-->It will distribute load equally to all the containers.It works with the help of reverse proxy.

Fork-->nginx reverse proxy repo--->and clone it


mkdir bank mobile nginx

bank:-
-----
vim bank/index.html

<h1> welcome to bank </h1>

vim Dockerfile

FROM nginx
COPY . /usr/share/nginx/html/

mobile :-
-----

vim mobile/index.html

<h1> welcome to mobile </h1>

vim Dockerfile

FROM nginx
COPY . /usr/share/nginx/html/

	   
nginx:
------

vim nginx.conf 

upstream loadbalancer {
 
 server 172.17.0.1:5001 weight=5;
 server 172.17.0.1:5002 weight=5;

}
server {
  location / {
  
  proxy_pass http://loadbalancer;
  
  }
}

---> check---> nginx -t

vim Dockerfile >> 

echo "FROM nginx "
RUN rm /etc/nginx/conf.d/default.conf
copy nginx.conf /etc/nginx/conf.d/default.conf




vim docker_compose.yml

---
version: "3"
services:
  app1:
    build: ./mobile
	ports: 
	  - "5001:80"
	  
  app2:
    build: ./bank
	ports:
	  - "5002:80"
	  
  nginx: 
     build: ./ngnix
	 ports:
	   - "8080:80"
	   
     depends_on:
	     - app1
	     - app2

--->docker-compose up -d
--->docker logs -->to check the logs
--->docker logs cont1

***********

git clone webapp-->https://github.com/JagadeeshKing908/dockerwebapp

rm -rf Docker-web ansible compose helm kubernetes

cd Docker-app/

rm -rf multistage

vim Dockerfile

FROM tomcat:8-jre11
RUN rm -rf /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh" ,"run"]

---->Install maven near pom.xml file

----->mvn clean package -D skipTests

-----> cp -r target Docker-app

--->cd Docker-app/ 

--->docker build -t appimage .

***cd docker-db

vim Dockerfile

FROM mysql:5.7.25
ENV MYSQL_ROOT_PASSWORD="devopspassword"
ENV MYSQL_DATABASE="accounts"

ADD db_backup.sql docker-entrypoint-initdb.d/dbbackup.sql

--->docker build -t dbimage .

---->First create db -->docker run -itd --name devopsdb -p 3306:3306 -v mysqlvolume:/var/lib/mysql/ dbimage

---->To check--->docker logs devopsdb

---->docker run -itd --name appcontainer -p 1234:8080 --link devopsdb:mysqlconnection appimage

--->docker logs appcontainer

---->

Day-11 :-
-------

swarm: used to run single app on multiple servers.

compose :--used to run multiple services on single server.

stack :-- swarm + compose

used to run multiple services on mutiple servers

vim compose.yml

---
version: '3'
services:
  web-1
   container_name: cont-1
   image: shaikmustafa/dm
   deploy:
     replicas: 3
   ports:
    - "8081:80"
   
   web-2
    container_name: cont-2
	image: shaikmustafa/cycle
	deploy:
	  replicas: 3
	ports:
	  - "8082:80"
	  
...


To run docker stack --->docker stack deploy mystack --compose-file=compose.yml

To see list of services --->docker service ls

To see list of stacks --->docker stack ls

To see the for particular app how many services are running ---> docker service ps appname

To delete stack --> docker stack rm mystack

To scaleup -->docker service scale mystack_web2=6 

To check stacks --->docker stack ls

To check cpu utilization --->docker stats cont1

***********************portainer is the tool used to access it with GUI-->allsetups--->publicip:9000 **********************************

NewRelic :--
---------


-------docker stats cont1

------->apt install stress -y

------- stress -c 2 -t 300


c - cpu's

-t - time in seconds.



Day-12:-
------

Docker extra Topics :--
--------------------

To Update containers data likr memory ,cpu --->docker update --cpus=0.5 --memory=20M cont2
To change any differance in container---->docker diff cont1--->A--Add , D--delete, c--changed
To create image from container -->docker commit cont5 imagebackup (It is mainly used for backup purposes)
To copy file from server to container -->dcoker cp index.html cont2:/usr/share/nginx/html/
To get file from container --->docker cp cont1:file.txt .
To check docker info like size memory--->docker system df
To remove image with volume ---->docker rm  -f -v cont7
To remove unused images--->docker image prune -a

Container Restart policies:-
------------------------
To restart container automatically --->docker run -itd --name cont6 restart=always nginx
To remove container after stoping ---->docker run -itd --rm --name cont7 nginx


docker project :-
--------------

sonar image :-->docker pull sonarqube:lts-community

Zomato for node js.

Day-13:-
-------

TRIVY & ECS :-
-------------

TRIVY : It provides security to our image
1)It is used to scan the images.
2)Open source anyone can access. developed by aqua access.
3)It checks vernerbulities.it check configurations.


To scan  : Trivy image image1

ECS :- Elastic container service 
----
-->we can create containers by using it.
-->It contains fargate(serverless i.e SAAS)


cluster--->services--->tasks(containers)

Steps to push image to Elastic cloud Registry(ECR):-
--------------------------------------------------
1)Attach IAM role to server (or) give IAM user credentials That should have valid permissions.
2)Go to ECR and create Repo
3)copy paste the push commands in server.

To create containers using ECS by ECR :--
-------------------------------------

1)Open ECS--Create cluster--Aws farget-->create
2)Task defination -->Aws fargate-->	1cpu 2gbram-->imageurlin ECS
3)create service---own security group-->loadbalacing










Podman installation :--
--------------------
curl -fsSL -o podman-linux-amd64.tar.gz https://github.com/mgoltzsche/podman-static/releases/latest/download/podman-linux-amd64.tar.gz

tar -xzf podman-linux-amd64.tar.gz
sudo cp -r podman-linux-amd64/usr/* /usr/
sudo cp -r podman-linux-amd64/etc/* /etc/


sudo dnf install -y iptables
sudo systemctl restart podman




some trouble shooting steps :
--------------------------------

if we have added two manger and removed one manager then we will get the error like below

[root@ip-172-31-20-254 ~]# docker node ls
Error response from daemon: rpc error: code = Unknown desc = The swarm does not have a leader. It's possible that too few managers are online. Make sure more than half of the managers are online.
[root@ip-172-31-20-254 ~]# 

solution :-->

run the command in the new manager server -->docker swarm init --force-new-cluster


