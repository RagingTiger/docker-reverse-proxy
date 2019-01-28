# base image
FROM nginx

# workdir
WORKDIR /etc/nginx/conf.d/

# copy config
COPY config/ ./

# get build args
ARG domain
ARG servname=reverse_proxy

# run args
RUN sed -i -e "s/DOMAIN/$domain/g; s/SERVNAME/$servname/g" reverse_proxy.conf

