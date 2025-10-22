# Usamos la imagen lts de Jenkins
FROM jenkins/jenkins:lts

# Argumento que recibiremos desde docker-compose.yml con el Group ID de Docker del host
ARG DOCKER_GID

# Cambiamos a usuario root para poder instalar y modificar permisos
USER root

# Creamos un grupo 'docker' dentro del contenedor con el GID del host.
# Si el grupo ya existe por alguna razón, no falla.
RUN if ! getent group ${DOCKER_GID}; then groupadd -g ${DOCKER_GID} docker; fi

# Agregamos al usuario 'jenkins' al grupo 'docker'
RUN usermod -aG docker jenkins

# Copiamos el binario de docker desde la imagen de docker-in-docker
COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin

# Volvemos a cambiar al usuario jenkins por seguridad
USER jenkins