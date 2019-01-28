# base image
FROM nginx

# copy config
COPY config/ /etc/nginx/

# setup ENV
ENV LISTEN_PORT=80 \
    SERVER_NAME=reverse_proxy \
    DOMAIN_PORT=80 \
    DOMAIN=_

# entry command
CMD /bin/sh -c \
    "envsubst < \
     /etc/nginx/reverse_proxy.tmpl > \
     /etc/nginx/conf.d/reverse_proxy.conf && \
     nginx -g 'daemon off;' || \
     printf '\n---> CONFIG ERROR: Check settings printed below\n\n' && \
     cat /etc/nginx/conf.d/reverse_proxy.conf"

