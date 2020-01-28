export IMAGE_URI=fernandoe/tmux
export IMAGE_TAG=latest

# XENIAL
docker build \
    --build-arg UBUNTU_VERSION=xenial-20200114 \
    --build-arg http_proxy=${http_proxy} \
    --build-arg https_proxy=${https_proxy} \
    -t ${IMAGE_URI}:${IMAGE_TAG} .

DOCKER_ID=$(docker create ${IMAGE_URI}:${IMAGE_TAG})

docker cp ${DOCKER_ID}:/app/tmux/tmux tmux

docker rm -v ${DOCKER_ID}

chmod +x tmux
mv tmux tmux_xenial


# BIONIC
docker build \
    --build-arg UBUNTU_VERSION=bionic-20200112 \
    --build-arg http_proxy=${http_proxy} \
    --build-arg https_proxy=${https_proxy} \
    -t ${IMAGE_URI}:${IMAGE_TAG} .

DOCKER_ID=$(docker create ${IMAGE_URI}:${IMAGE_TAG})

docker cp ${DOCKER_ID}:/app/tmux/tmux tmux

docker rm -v ${DOCKER_ID}

chmod +x tmux
mv tmux tmux_bionic
