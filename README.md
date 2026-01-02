# jax-projects
## Install
Build docker image
```
docker build -t jax_img -f Dockerfile .
```
Build container
```
docker run --rm -u $(id -u):$(id -g) --name jax_ctn -it --network host --ipc=host --ulimit memlock=-1 --ulimit stack=67108864 --gpus all --volume="$PWD:/workspace" -w /workspace/ jax_img bash
```