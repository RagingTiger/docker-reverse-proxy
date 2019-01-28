# base image
FROM nginx

# workdir
WORKDIR /etc/nginx/conf.d/

# copy config
COPY config/ ./

# get build args
ARG domain
ARG servname=reverse_proxy
ARG listen_port=80
ARG proxy_port=80

# run args
RUN sed -i -e "s/DOMAIN/$domain/g; \
               s/SERVNAME/$servname/g; \
               s/LISTEN_PORT/$listen_port/g; \
               s/PROXY_PORT/$proxy_port/g;" \
               reverse_proxy.conf

