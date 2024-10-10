example1:

Note: While creating images docker file name should be Dockerfile.

>> mkdir ubuntu-docker

>> cd ubuntu-docker

>> mkdir Dockerfile

>> vi Dockerfile

FROM ubuntu:18.04
LABEL maintainer="someauth@gmail.com"

RUN apt-get update && apt-get -y install apache2
EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]


Before you create docker image list available images and containers

>> docker images
>> docker ps -a

To create docker image using file

>> docker build -t [accountname]/[reponame]or[imagename] .

ex >> docker build -t sireeshau472/ubuntu-apache-image .

Now list docker images

>> docker images

Next, create conatiner and run

>> docker run -dt --name apache2 -p 8080:80 sireeshau472/ubuntu-apache-image

Now go to browser and give dockerhost ip:hostport

ex: 198.4.5.5:8080

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


example2:

>> mkdir ubuntu-custom-apache

>> touch index.html ( keep content for custome welcomepage

>> cd ubuntu-custom-apache

>> mkdir Dockerfile

>> vi Dockerfile

FROM ubuntu:18.04
LABEL maintainer="someauth@gmail.com"

RUN apt-get update && apt-get -y install apache2
EXPOSE 80

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]

COPY index.html /var/www/html/index.html
VOLUME /var/www/html

>> docker build -t sireeshau472/ubuntu-custom-apache .

now list docker images

>> docker images

next, run docker images
>> docker run -dt --name apche-custome -p 8081:80 sireeshau472/ubuntu-custom-apache

now see the container

>> docker ps -a/docker ps

Now go to browser and give dockerhost ip:hostport

ex: 198.4.5.5:8081
