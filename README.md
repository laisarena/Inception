# Inception
System Administration project to learn docker compose

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
