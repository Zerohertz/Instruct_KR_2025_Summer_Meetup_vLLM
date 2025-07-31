#!/bin/bash

curl http://localhost:8000/metrics

# $ src/08_metrics.sh
# # HELP vllm:lora_requests_info Running stats on lora requests.
# # TYPE vllm:lora_requests_info gauge
# vllm:lora_requests_info{max_lora="0",running_lora_adapters="",waiting_lora_adapters=""} 1.753628553989693e+09
# # HELP vllm:cache_config_info Information of the LLMEngine CacheConfig
# # TYPE vllm:cache_config_info gauge
# vllm:cache_config_info{block_size="16",cache_dtype="auto",calculate_kv_scales="False",cpu_kvcache_space_bytes="4294967296",cpu_offload_gb="0.0",enable_prefix_caching="None",gpu_memory_utilization="0.9",is_attention_free="False",num_cpu_blocks="0",num_gpu_blocks="2340",num_gpu_blocks_override="None",prefix_caching_hash_algo="builtin",sliding_window="None",swap_space="4.0",swap_space_bytes="4294967296.0"} 1.0
# # HELP vllm:num_preemptions_total Cumulative number of preemption from the engine.
# # TYPE vllm:num_preemptions_total counter
# vllm:num_preemptions_total{model_name="Qwen/Qwen3-0.6B"} 0.0
# # HELP vllm:prompt_tokens_total Number of prefill tokens processed.
# # TYPE vllm:prompt_tokens_total counter
# vllm:prompt_tokens_total{model_name="Qwen/Qwen3-0.6B"} 14.0
# # HELP vllm:generation_tokens_total Number of generation tokens processed.
# # TYPE vllm:generation_tokens_total counter
# vllm:generation_tokens_total{model_name="Qwen/Qwen3-0.6B"} 107.0
# # HELP vllm:request_success_total Count of successfully processed requests.
# # TYPE vllm:request_success_total counter
# vllm:request_success_total{finished_reason="stop",model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:iteration_tokens_total Histogram of number of tokens per engine_step.
# # TYPE vllm:iteration_tokens_total histogram
# vllm:iteration_tokens_total_sum{model_name="Qwen/Qwen3-0.6B"} 121.0
# vllm:iteration_tokens_total_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 1092.0
# vllm:iteration_tokens_total_bucket{le="8.0",model_name="Qwen/Qwen3-0.6B"} 1092.0
# vllm:iteration_tokens_total_bucket{le="16.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="32.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="64.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="128.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="256.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="512.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="1024.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="2048.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="4096.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="8192.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="16384.0",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1093.0
# vllm:iteration_tokens_total_count{model_name="Qwen/Qwen3-0.6B"} 1093.0
# # HELP vllm:time_to_first_token_seconds Histogram of time to first token in seconds.
# # TYPE vllm:time_to_first_token_seconds histogram
# vllm:time_to_first_token_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 0.2756359577178955
# vllm:time_to_first_token_seconds_bucket{le="0.001",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.005",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.01",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.02",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.04",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.06",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.08",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.1",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.25",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_to_first_token_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="0.75",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="7.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="80.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="160.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="640.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="2560.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:time_to_first_token_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:time_per_output_token_seconds Histogram of time per output token in seconds.
# # TYPE vllm:time_per_output_token_seconds histogram
# vllm:time_per_output_token_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 2.254702091217041
# vllm:time_per_output_token_seconds_bucket{le="0.01",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:time_per_output_token_seconds_bucket{le="0.025",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.05",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.075",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.1",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.15",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.2",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.4",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="0.75",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="7.5",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="80.0",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 106.0
# vllm:time_per_output_token_seconds_count{model_name="Qwen/Qwen3-0.6B"} 106.0
# # HELP vllm:e2e_request_latency_seconds Histogram of end to end request latency in seconds.
# # TYPE vllm:e2e_request_latency_seconds histogram
# vllm:e2e_request_latency_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 2.5305089950561523
# vllm:e2e_request_latency_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="0.8",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="1.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:e2e_request_latency_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="15.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="30.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="60.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="120.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="240.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="480.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="960.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="1920.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="7680.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:e2e_request_latency_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_queue_time_seconds Histogram of time spent in WAITING phase for request.
# # TYPE vllm:request_queue_time_seconds histogram
# vllm:request_queue_time_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 0.0024089813232421875
# vllm:request_queue_time_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="0.8",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="1.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="15.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="30.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="60.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="120.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="240.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="480.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="960.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="1920.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="7680.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_queue_time_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_inference_time_seconds Histogram of time spent in RUNNING phase for request.
# # TYPE vllm:request_inference_time_seconds histogram
# vllm:request_inference_time_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 2.52810001373291
# vllm:request_inference_time_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="0.8",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="1.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_inference_time_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="15.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="30.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="60.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="120.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="240.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="480.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="960.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="1920.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="7680.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_inference_time_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_prefill_time_seconds Histogram of time spent in PREFILL phase for request.
# # TYPE vllm:request_prefill_time_seconds histogram
# vllm:request_prefill_time_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 0.2732269763946533
# vllm:request_prefill_time_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="0.8",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="1.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="15.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="30.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="60.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="120.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="240.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="480.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="960.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="1920.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="7680.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prefill_time_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_decode_time_seconds Histogram of time spent in DECODE phase for request.
# # TYPE vllm:request_decode_time_seconds histogram
# vllm:request_decode_time_seconds_sum{model_name="Qwen/Qwen3-0.6B"} 2.254873037338257
# vllm:request_decode_time_seconds_bucket{le="0.3",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="0.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="0.8",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="1.5",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_decode_time_seconds_bucket{le="2.5",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="15.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="30.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="40.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="60.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="120.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="240.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="480.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="960.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="1920.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="7680.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_decode_time_seconds_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_prompt_tokens Number of prefill tokens processed.
# # TYPE vllm:request_prompt_tokens histogram
# vllm:request_prompt_tokens_sum{model_name="Qwen/Qwen3-0.6B"} 14.0
# vllm:request_prompt_tokens_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_prompt_tokens_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_prompt_tokens_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_prompt_tokens_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_prompt_tokens_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="100.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="200.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="500.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="1000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="2000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="5000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_prompt_tokens_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_generation_tokens Number of generation tokens processed.
# # TYPE vllm:request_generation_tokens histogram
# vllm:request_generation_tokens_sum{model_name="Qwen/Qwen3-0.6B"} 107.0
# vllm:request_generation_tokens_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="100.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_generation_tokens_bucket{le="200.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_bucket{le="500.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_bucket{le="1000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_bucket{le="2000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_bucket{le="5000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_generation_tokens_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_params_n Histogram of the n request parameter.
# # TYPE vllm:request_params_n histogram
# vllm:request_params_n_sum{model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_n_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_max_num_generation_tokens Histogram of maximum number of requested generation tokens.
# # TYPE vllm:request_max_num_generation_tokens histogram
# vllm:request_max_num_generation_tokens_sum{model_name="Qwen/Qwen3-0.6B"} 107.0
# vllm:request_max_num_generation_tokens_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="100.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_max_num_generation_tokens_bucket{le="200.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_bucket{le="500.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_bucket{le="1000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_bucket{le="2000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_bucket{le="5000.0",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_max_num_generation_tokens_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:request_params_max_tokens Histogram of the max_tokens request parameter.
# # TYPE vllm:request_params_max_tokens histogram
# vllm:request_params_max_tokens_sum{model_name="Qwen/Qwen3-0.6B"} 8178.0
# vllm:request_params_max_tokens_bucket{le="1.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="2.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="5.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="10.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="20.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="50.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="100.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="200.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="500.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="1000.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="2000.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="5000.0",model_name="Qwen/Qwen3-0.6B"} 0.0
# vllm:request_params_max_tokens_bucket{le="+Inf",model_name="Qwen/Qwen3-0.6B"} 1.0
# vllm:request_params_max_tokens_count{model_name="Qwen/Qwen3-0.6B"} 1.0
# # HELP vllm:num_requests_running Number of requests currently running on GPU.
# # TYPE vllm:num_requests_running gauge
# vllm:num_requests_running{model_name="Qwen/Qwen3-0.6B"} 0.0
# # HELP vllm:num_requests_waiting Number of requests waiting to be processed.
# # TYPE vllm:num_requests_waiting gauge
# vllm:num_requests_waiting{model_name="Qwen/Qwen3-0.6B"} 0.0
# # HELP vllm:gpu_cache_usage_perc GPU KV-cache usage. 1 means 100 percent usage.
# # TYPE vllm:gpu_cache_usage_perc gauge
# vllm:gpu_cache_usage_perc{model_name="Qwen/Qwen3-0.6B"} 0.0
