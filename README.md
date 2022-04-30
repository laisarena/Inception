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

#### Services
Computing resouce within an application with can be scaled/replaced idependently from other componentes. Are defined by a Docker image and set of runtime arguments.

### Compose file
The Compose file is a YAML file defining services, networks, and volumes for a Docker application.

[Compose File](https://docs.docker.com/compose/compose-file/)

[init(PID 1)](https://docs.docker.com/compose/compose-file/#init)
