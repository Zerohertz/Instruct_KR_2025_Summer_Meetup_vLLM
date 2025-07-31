#!/bin/bash

# NOTE: master
docker run \
	-d \
	--entrypoint /bin/bash \
	--network host \
	--shm-size 10.24g \
	-v /dev/shm:/dev/shm \
	-v "${PATH_TO_HF_HOME}:/root/.cache/huggingface" \
	-e VLLM_HOST_IP=${NODE_IP} \
	-e GLOO_SOCKET_IFNAME=${GLOO_SOCKET_IFNAME} \
	-e NCCL_IB_DISABLE=1 \
	vllm/vllm-openai:v0.9.2 \
	-c "uv pip install ray[default] --system && ray start --head --port=6379 --disable-usage-stats --dashboard-host=0.0.0.0 && tail -f /dev/null"

# NOTE: worker
docker run \
	-d \
	--entrypoint /bin/bash \
	--network host \
	--shm-size 10.24g \
	-v /dev/shm:/dev/shm \
	-v "${PATH_TO_HF_HOME}:/root/.cache/huggingface" \
	-e VLLM_HOST_IP=${NODE_IP} \
	-e GLOO_SOCKET_IFNAME=${GLOO_SOCKET_IFNAME} \
	-e NCCL_IB_DISABLE=1 \
	vllm/vllm-openai:v0.9.2 \
	-c "uv pip install ray[default] --system && ray start --block --address=${MASTER_NODE_IP}:6379 && tail -f /dev/null"

# NOTE: master
vllm serve Qwen/Qwen3-235B-A22B \
	--distributed-executor-backend ray \
	--host=0.0.0.0 --port=8080 \
	--tensor-parallel-size=8 --pipeline-parallel-size=2 \
	--gpu_memory_utilization=0.95 \
	--reasoning-parser qwen3
