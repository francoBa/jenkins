#!/bin/bash

# Ponemos el script en modo estricto para que falle si algo va mal
set -e

# 1. Comprobar si el archivo .env existe.
if [ ! -f .env ]; then
  echo "Archivo .env no encontrado. Creándolo ahora..."
  # 2. Si no existe, lo creamos con el GID del grupo docker del host.
  echo "DOCKER_GID=$(getent group docker | cut -d: -f3)" > .env
  echo "Archivo .env creado con éxito."
fi

# 3. Ejecutar docker compose, pasando todos los argumentos que recibió este script.
# Por ejemplo, si ejecutas ./start.sh up -d, aquí se ejecutará docker compose up -d
echo "Iniciando servicios con Docker Compose..."
docker compose "$@"