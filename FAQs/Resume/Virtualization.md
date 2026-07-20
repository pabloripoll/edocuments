# Virtualization

Linux namespaces, hipervisor

Content: Docker, Kubernetes

## Docker

Docker is a software platform that allows you to build, test, and deploy applications quickly. Docker packages software into standardized units called containers that have everything the software needs to run including libraries, system tools, code, and runtime

### Usage:
- It most usage is for packing apps in a standarized development enviroment into containers

### Best practices:
- The smaller the build image, the better because the fewer the steps on building the container, the better de installation and layer compiling performance

Running the below Dockerfile example by `$ docker build -t many_layers .` and then `$ docker history many_layers .` it will be seen that each ram step corresponds to each different layer / command line
```
FROM alpine:latest
RUN apk update
RUN apk add curl
RUN apk add vim
RUN apk add git
```
Will be better as it consumes less ram
```
FROM alpine:latest
RUN apk update && \
    apk add curl \
            vim \
            git
```

#### Docker, buenas prácticas
https://www.youtube.com/watch?v=z0TITJFlukI

## Kubernetes

#### Prioridades en Kubernetes
https://www.youtube.com/watch?v=OZfqdHVuYjQ

#### No necesitas Kubernetes
https://www.youtube.com/watch?v=_RZQMKTJyIs