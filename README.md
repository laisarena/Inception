# Inception
System Administration project to learn docker compose

## Dockerfile

### [CMD](https://docs.docker.com/engine/reference/builder/#cmd)
Provide defaults for an executing container.
The `CMD` instruction has three forms:
- exec form (preferred form)
```
CMD ["executable","param1","param2"]
```
- defaut parameters to ENTRYPOINT
```
CMD ["param1","param2"]
```
- shell form
````
CMD command param1 param2
````

Unlike the shell form, the exec form does not invoke a command shell.

Note: `RUN` actually runs a command and commits the result; `CMD` does not execute anything at build time, but specifies the intended command for the image.

### [ENTRYPOINT](https://docs.docker.com/engine/reference/builder/#entrypoint)
Allows you to configure a container that will run as an executable.
Has two forms:

- exec form (preferred form):

```
ENTRYPOINT ["executable", "param1", "param2"
```
- shell form:
```
ENTRYPOINT command param1 param2
```

Note: When shell form is used, `ENTRYPOINT` will be started as a subcommand of `/bin/sh -c`, which does not pass signals. This means that the executable will not be the container’s `PID 1` - and will not receive Unix signals - so your executable will not receive a SIGTERM from `docker stop <container>`.


## Nginx Image

A container stands up while its main process (PID 1) is running. Therefore, the `ENTRYPOINT` command must be something that runs until it receives a signal.

For the nginx container, which works as our web server, it is a good pratrice to use `ENTRYPOINT ["nginx", "-g", "daemon off;"]`. This command starts nginx in foreground because of the diective `deamon off;`. Thus, nginx is the only service of this container running on PID 1.

[stack overflow - difference between nginx daemon on/off option](https://stackoverflow.com/questions/25970711/what-is-the-difference-between-nginx-daemon-on-off-option#:~:text=For%20Docker%20containers%20(or%20for%20debugging)%2C%20the%20daemon%20off%3B%20directive%20tells%20Nginx%20to%20stay%20in%20the%20foreground.%20For%20containers%20this%20is%20useful%20as%20best%20practice%20is%20for%20one%20container%20%3D%20one%20process.%20One%20server%20(container)%20has%20only%20one%20service.)

## Docker Compose

- tool for defining and running multi-container Docker applications
- use a YAML file to configure application’s services
- Create and start all the services with a single command

The features of Compose that make it effective are:
- Multiple isolated environments on a single host
- Preserve volume data when containers are created
- Only recreate containers that have changed
- Variables and moving a composition between environments



[Compose](https://docs.docker.com/compose/)

[Features](https://docs.docker.com/compose/#features)

### The Compose application model [(link)](https://docs.docker.com/compose/compose-file/#the-compose-application-model)
Set of containers whitch have to run together with adequade shared resources and comminication channels.

- [Services](https://docs.docker.com/compose/compose-file/#services-top-level-element) -> computing components
- [Networks](https://docs.docker.com/compose/compose-file/#networks-top-level-element) -> The layer that allow services to communicate with each other. Plataform capability abstraction to estabilish an IP route between containers within services connected together
- [Volumes](https://docs.docker.com/compose/compose-file/#volumes-top-level-element) -> where services store and share persistent data

### Services
Computing resouce within an application with can be scaled/replaced idependently from other componentes. Are defined by a Docker image and set of runtime arguments.

### Volumes
Persistent data stores.

References:
- [Manage data in Docker](https://docs.docker.com/storage/)
- [Volumes compose file element](https://docs.docker.com/compose/compose-file/#volumes-top-level-element)
- [Volumes](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes)
- [Docker volume create](https://docs.docker.com/engine/reference/commandline/volume_create/)
- [Create local volume with custom mount options](https://forums.docker.com/t/create-local-volume-with-custom-mount-options/117924)

### Compose file
The Compose file is a YAML file defining services, networks, and volumes for a Docker application.

[Compose File](https://docs.docker.com/compose/compose-file/)

### Environment variables
- [Environment variables in Compose](https://docs.docker.com/compose/environment-variables/)
- [Declare default environment variables in file](https://docs.docker.com/compose/env-file/)


## NGINX
- [How nginx processes a request](https://nginx.org/en/docs/http/request_processing.html)
- [sll directives](https://nginx.org/en/docs/http/ngx_http_ssl_module.html)
- [server_name](https://nginx.org/en/docs/http/server_names.html)
- [try_files](https://nginx.org/en/docs/http/ngx_http_core_module.html#try_files)

## PHP
- [Running phpinfo() diagnostics](https://www.gurock.com/testrail/docs/admin/howto/running-phpinfo/)