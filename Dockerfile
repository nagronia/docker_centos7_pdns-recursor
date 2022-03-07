## Base the image on CentOS 7
FROM centos:7

## Label Information
LABEL image-name="centos7_pdns-recursor"
LABEL maintainer="thomas.morgan@nagronia.co.uk"
 
## Install the required packages
RUN yum makecache
RUN yum upgrade -y
RUN yum install -y epel-release
RUN yum install -y pdns-recursor

## Backup the initial config file. 
RUN cp /etc/pdns-recursor/recursor.conf  /etc/pdns-recursor/recursor.conf.original

## Copy the containers config file with basic settings that refer to recursor.d folder. 
COPY ./files/recursor.conf /etc/pdns-recursor/recursor.conf

## Make sure the recursor.d folder is created. 
RUN mkdir -p /etc/pdns-recursor/recursor.d/

## Expose the DNS ports 
EXPOSE 53/tcp
EXPOSE 53/udp

## Run the pdns_recursor
CMD [ "/usr/sbin/pdns_recursor" ]