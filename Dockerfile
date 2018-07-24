FROM nginx
MAINTAINER justin.wilson@melbourneit.com.au

#COPY files/conf.d/*.conf /etc/nginx/conf.d/
COPY files/ /etc/nginx/

EXPOSE 80 443

#RUN apk update && apk upgrade
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

#ENTRYPOINT /usr/sbin/nginx
#ENTRYPOINT /etc/init.d/nginx start
#ENTRYPOINT /usr/sbin/nginx -g 'daemon off;'
CMD ["nginx", "-g", "daemon off; error_log stderr info;"]
