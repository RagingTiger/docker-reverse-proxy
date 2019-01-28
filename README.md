## About
A **reverse proxy** using a Dockerized **NGINX** server

## Usage
Usage of the proxy is simple. You only need to declare a few `ENV` variables
that will be passed at the docker container run time. The variables are as
follows:
```
DOMAIN='http://example.com'
LISTEN_PORT=80 (default)
DOMAIN_PORT=80 (default)
SERVER_NAME=reverse_proxy (default)
```

As an example, here is a possible setup:
```
$ docker run -p 5000:5000 -e DOMAIN='http://myapp.com' -e LISTEN_PORT=5000 -e DOMAIN_PORT=8080 tigerj/rvrsprxy
```

This will run your **NGINX reverse proxy** on port **5000**, while forwarding
traffic to port **8080** at domain name `http://myapp.com`.
