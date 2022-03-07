# docker-centos7_pdns-recursor

# To build the image use the following command...
docker build -t nagronia/centos7_pdns-recursor /root/wip/centos7_pdns-recursor/

# To run your newly built image first create a folder for your config files 
mkdir -p /srv/etc/powerdns/recursor.d/

# Then use the following command to run the image.
docker run -d \
  --name pdns-recursor01 \
  --privileged \
  --restart=unless-stopped \
  -e TZ=Europe/London \
  -v /srv/etc/powerdns/recursor.d/:/etc/powerdns/recursor.d/ \ 
  -p 5300:53/udp \
  -p 5300:53/tcp \
  nagronia/centos7_pdns-recursor

# To review the logs for the container use the following command...
docker logs pdns-recursor01 

# To kill and remove the container us the following commands...
docker container kill pdns-recursor01
docker container rm pdns-recursor01



