#!/bin/bash

# Variáveis
DOCKER_USERNAME="seu_usuario"
DOCKER_PASSWORD="sua_senha"
DOCKER_IMAGE="nome_da_imagem"
DOCKER_TAG="tag_da_imagem"
DOCKER_REPO="seu_repositorio"

# Login no Docker Hub
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# Verificando se o login foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "Falha ao fazer login no Docker Hub"
    exit 1
fi

# Tag da imagem
docker tag "${DOCKER_IMAGE}" "${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}"

# Push da imagem
docker push "${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}"

# Verificando se o push foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "Imagem enviada com sucesso para ${DOCKER_USERNAME}/${DOCKER_REPO}:${DOCKER_TAG}"
else
    echo "Falha ao enviar a imagem"
    exit 1
fi
