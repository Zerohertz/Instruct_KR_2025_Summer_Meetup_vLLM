#!/bin/bash

# NOTE:
# vLLM 설치 (uv가 없다면 pip로 설치)
# uv pip install vllm==0.9.2

# NOTE:
# huggingface-cli를 통해 모델 설치 (생략 가능)
# huggingface-cli download Qwen/Qwen3-0.6B --local-dir ./qwen3-0.6B

vllm serve Qwen/Qwen3-0.6B --max-model-len 8192

# NOTE: 만약 모델을 `~/.cache/huggingface/hub` 경로에 저장하지 않았다면,
# (`--local-dir`을 사용하지 않고 huggingface-cli로 다운로드 했거나 vllm serve를 다운로드 하지 않고 실행했다면)
# `vllm serve ./qwen3-0.6B --max-model-len 8192`와 같이 실행

# NOTE:
# tool calling을 위해선 아래와 같은 인자들을 함께 넣어 사용
# `--enable-auto-tool-choice --tool-call-parser hermes`
# https://docs.vllm.ai/en/stable/features/tool_calling.html
# https://qwen.readthedocs.io/en/latest/deployment/vllm.html#parsing-tool-calls

# NOTE:
# reasoning model을 사용할 땐 chat template을 수정하거나 아래 인자 사용
# `--reasoning-parser qwen3`
# https://docs.vllm.ai/en/stable/features/reasoning_outputs.html
# https://docs.vllm.ai/en/stable/cli/index.html#-reasoning-parser
# https://qwen.readthedocs.io/en/latest/deployment/vllm.html#parsing-thinking-content

# $ src/00_vllm_serve.sh
# INFO 07-27 20:28:00 [__init__.py:244] Automatically detected platform cpu.
# INFO 07-27 20:28:02 [api_server.py:1395] vLLM API server version 0.9.2
# INFO 07-27 20:28:02 [cli_args.py:325] non-default args: {'model': 'Qwen/Qwen3-0.6B', 'max_model_len': 8192}
# INFO 07-27 20:28:05 [config.py:841] This model supports multiple tasks: {'classify', 'reward', 'embed', 'generate'}. Defaulting to 'generate'.
# WARNING 07-27 20:28:05 [config.py:3320] Your device 'cpu' doesn't support torch.bfloat16. Falling back to torch.float16 for compatibility.
# WARNING 07-27 20:28:05 [config.py:3371] Casting torch.bfloat16 to torch.float16.
# INFO 07-27 20:28:05 [config.py:1472] Using max model len 8192
# INFO 07-27 20:28:05 [arg_utils.py:1746] cpu is experimental on VLLM_USE_V1=1. Falling back to V0 Engine.
# WARNING 07-27 20:28:05 [cpu.py:131] Environment variable VLLM_CPU_KVCACHE_SPACE (GiB) for CPU backend is not set, using 4 by default.
# INFO 07-27 20:28:05 [api_server.py:268] Started engine process with PID 69453
# INFO 07-27 20:28:07 [__init__.py:244] Automatically detected platform cpu.
# INFO 07-27 20:28:08 [llm_engine.py:230] Initializing a V0 LLM engine (v0.9.2) with config: model='Qwen/Qwen3-0.6B', speculative_config=None, tokenizer='Qwen/Qwen3-0.6B', skip_tokenizer_init=False, tokenizer_mode=auto, revision=None, override_neuron_config={}, tokenizer_revision=None, trust_remote_code=False, dtype=torch.float16, max_seq_len=8192, download_dir=None, load_format=LoadFormat.AUTO, tensor_parallel_size=1, pipeline_parallel_size=1, disable_custom_all_reduce=True, quantization=None, enforce_eager=False, kv_cache_dtype=auto,  device_config=cpu, decoding_config=DecodingConfig(backend='auto', disable_fallback=False, disable_any_whitespace=False, disable_additional_properties=False, reasoning_backend=''), observability_config=ObservabilityConfig(show_hidden_metrics_for_version=None, otlp_traces_endpoint=None, collect_detailed_traces=None), seed=0, served_model_name=Qwen/Qwen3-0.6B, num_scheduler_steps=1, multi_step_stream_outputs=True, enable_prefix_caching=None, chunked_prefill_enabled=False, use_async_output_proc=False, pooler_config=None, compilation_config={"level":0,"debug_dump_path":"","cache_dir":"","backend":"","custom_ops":[],"splitting_ops":[],"use_inductor":true,"compile_sizes":[],"inductor_compile_config":{"enable_auto_functionalized_v2":false},"inductor_passes":{},"use_cudagraph":true,"cudagraph_num_of_warmups":0,"cudagraph_capture_sizes":[],"cudagraph_copy_inputs":false,"full_cuda_graph":false,"max_capture_size":256,"local_cache_dir":null}, use_cached_outputs=True,
# WARNING 07-27 20:28:09 [cpu_worker.py:447] Auto thread-binding is not supported due to the lack of package numa and psutil,fallback to no thread-binding. To get better performance,please try to manually bind threads.
# INFO 07-27 20:28:09 [cpu.py:69] Using Torch SDPA backend.
# INFO 07-27 20:28:09 [importing.py:63] Triton not installed or not compatible; certain GPU-related functions will not be available.
# INFO 07-27 20:28:09 [parallel_state.py:1076] rank 0 in world size 1 is assigned as DP rank 0, PP rank 0, TP rank 0, EP rank 0
# INFO 07-27 20:28:09 [weight_utils.py:292] Using model weights format ['*.safetensors']
# INFO 07-27 20:28:10 [weight_utils.py:345] No model.safetensors.index.json found in remote.
# Loading safetensors checkpoint shards:   0% Completed | 0/1 [00:00<?, ?it/s]
# Loading safetensors checkpoint shards: 100% Completed | 1/1 [00:01<00:00,  1.28s/it]
# Loading safetensors checkpoint shards: 100% Completed | 1/1 [00:01<00:00,  1.28s/it]
#
# INFO 07-27 20:28:11 [default_loader.py:272] Loading weights took 1.28 seconds
# INFO 07-27 20:28:11 [executor_base.py:113] # cpu blocks: 2340, # CPU blocks: 0
# INFO 07-27 20:28:11 [executor_base.py:118] Maximum concurrency for 8192 tokens per request: 4.57x
# INFO 07-27 20:28:12 [llm_engine.py:428] init engine (profile, create kv cache, warmup model) took 0.66 seconds
# WARNING 07-27 20:28:12 [config.py:1392] Default sampling parameters have been overridden by the model's Hugging Face generation config recommended from the model creator. If this is not intended, please relaunch vLLM instance with `--generation-config vllm`.
# INFO 07-27 20:28:12 [serving_chat.py:125] Using default chat sampling params from model: {'temperature': 0.6, 'top_k': 20, 'top_p': 0.95}
# INFO 07-27 20:28:13 [serving_completion.py:72] Using default completion sampling params from model: {'temperature': 0.6, 'top_k': 20, 'top_p': 0.95}
# INFO 07-27 20:28:13 [api_server.py:1457] Starting vLLM API server 0 on http://0.0.0.0:8000
# INFO 07-27 20:28:13 [launcher.py:29] Available routes are:
# INFO 07-27 20:28:13 [launcher.py:37] Route: /openapi.json, Methods: HEAD, GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /docs, Methods: HEAD, GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /docs/oauth2-redirect, Methods: HEAD, GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /redoc, Methods: HEAD, GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /health, Methods: GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /load, Methods: GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /ping, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /ping, Methods: GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /tokenize, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /detokenize, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/models, Methods: GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /version, Methods: GET
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/chat/completions, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/completions, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/embeddings, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /pooling, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /classify, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /score, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/score, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/audio/transcriptions, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/audio/translations, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /rerank, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v1/rerank, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /v2/rerank, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /invocations, Methods: POST
# INFO 07-27 20:28:13 [launcher.py:37] Route: /metrics, Methods: GET
# INFO:     Started server process [69408]
# INFO:     Waiting for application startup.
# INFO:     Application startup complete.
