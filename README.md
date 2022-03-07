# docker-centos7_pdns-recursor

This is a really basic build using the official CentOS7 image to build a VERY basic PowerDNS Recusor. Once up and running you should be able to add *.conf files to your /srv/docker/etc/powerdns/recursor.d/ directory to start customising the install. 

To build the image use the following command...
Note: The last argument is the location of the folder...

`docker build -t nagronia/centos7_pdns-recursor ./docker_centos7_pdns-recursor/`

To run your newly built image first create a folder for your config files...

`mkdir -p /srv/docker/etc/powerdns/recursor.d/`

Then use the following command to run the image...
```
docker run -d \
  --name pdns-recursor01 \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/London \
  -v /srv/docker/etc/powerdns/recursor.d/:/etc/powerdns/recursor.d/ \
  -p 53:53/udp \
  -p 53:53/tcp \
  nagronia/centos7_pdns-recursor
```

To review the logs for the container use the following command...

`docker logs pdns-recursor01`

To kill and remove the container us the following commands...
```
docker container kill pdns-recursor01
docker container rm pdns-recursor01
```


