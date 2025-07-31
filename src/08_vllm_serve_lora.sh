#!/bin/bash

# NOTE: https://docs.vllm.ai/en/v0.9.2/features/lora.html

# NOTE:
# 1. Static serving LoRA Adapters
vllm serve Qwen/Qwen3-0.6B --max-model-len 8192 \
	--reasoning-parser qwen3 \
	--enable-lora \
	--lora-modules phh/Qwen3-0.6B-TLDR-Lora=phh/Qwen3-0.6B-TLDR-Lora

# 여러 LoRA adapter 서빙 시 아래와 같이 사용 가능
# --lora-modules '{"name": "phh/Qwen3-0.6B-TLDR-Lora", "path": "phh/Qwen3-0.6B-TLDR-Lora"}'

# NOTE:
# 2. Dynamic serving LoRA Adapters
VLLM_ALLOW_RUNTIME_LORA_UPDATING=True vllm serve Qwen/Qwen3-0.6B --max-model-len 8192 \
	--reasoning-parser qwen3 \
	--enable-lora

curl -X POST http://localhost:8000/v1/load_lora_adapter \
	-H "Content-Type: application/json" \
	-d '{
    "lora_name": "phh/Qwen3-0.6B-TLDR-Lora",
    "lora_path": "phh/Qwen3-0.6B-TLDR-Lora"
}'
curl -X POST http://localhost:8000/v1/unload_lora_adapter \
	-H "Content-Type: application/json" \
	-d '{
    "lora_name": "phh/Qwen3-0.6B-TLDR-Lora" 
}'
# Success: LoRA adapter 'phh/Qwen3-0.6B-TLDR-Lora' added successfully.

# $ curl http://localhost:8000/v1/models | jq
#
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100   965  100   965    0     0  78315      0 --:--:-- --:--:-- --:--:-- 80416
# {
#   "object": "list",
#   "data": [
#     {
#       "id": "Qwen/Qwen3-0.6B",
#       "object": "model",
#       "created": 1753880728,
#       "owned_by": "vllm",
#       "root": "Qwen/Qwen3-0.6B",
#       "parent": null,
#       "max_model_len": 8192,
#       "permission": [
#         {
#           "id": "modelperm-aea81163065e41fabfc1a0c7e0a7e257",
#           "object": "model_permission",
#           "created": 1753880728,
#           "allow_create_engine": false,
#           "allow_sampling": true,
#           "allow_logprobs": true,
#           "allow_search_indices": false,
#           "allow_view": true,
#           "allow_fine_tuning": false,
#           "organization": "*",
#           "group": null,
#           "is_blocking": false
#         }
#       ]
#     },
#     {
#       "id": "phh/Qwen3-0.6B-TLDR-Lora",
#       "object": "model",
#       "created": 1753880728,
#       "owned_by": "vllm",
#       "root": "phh/Qwen3-0.6B-TLDR-Lora",
#       "parent": "Qwen/Qwen3-0.6B",
#       "max_model_len": null,
#       "permission": [
#         {
#           "id": "modelperm-6760cb39f4d84be88db9523ba80a4460",
#           "object": "model_permission",
#           "created": 1753880728,
#           "allow_create_engine": false,
#           "allow_sampling": true,
#           "allow_logprobs": true,
#           "allow_search_indices": false,
#           "allow_view": true,
#           "allow_fine_tuning": false,
#           "organization": "*",
#           "group": null,
#           "is_blocking": false
#         }
#       ]
#     }
#   ]
# }

# $ curl -X POST http://localhost:8000/v1/chat/completions \
#         -H "Content-Type: application/json" \
#         -d '{
#     "model": "Qwen/Qwen3-0.6B",
#     "messages": [
#       {
#         "role": "user",
#         "content": "강천성 (Logan Kang) / Dable & Coinbase (BASE) @Logan \nUltrathinking AI Agent in Base: Base 블록체인의 AI Agent Framework인 AgentKit를 소개합니다. Ultrathink Engineer가 블록체인 환경에서 빠르게 AI Agent를 만들 수 있는 비법을 소개합니다.\n고석현 / Sionic AI @정자초등학교 \nTBD\n채승우 / 하피챗 @cyoo \nPushing the boundaries of AI storytelling: 단일 LLM 요청으로 이루어진 기존 AI 롤플레이 시스템의 한계. 그리고 그 한계를 뛰어넘기 위해 astrsk에서 에이전틱 워크플로를 만든 과정을 설명합니다.\n현지웅 / 뤼튼테크놀로지스 @jiwunghyun \nChat 인터페이스와 플랫폼은 공존할 수 있을까?: Chat 인터페이스가 가져온 기존 플랫폼 공식의 변화에 대해 이야기하고 그에 대한 각 서비스들이 풀고 있는 전략들에 대해 이야기해보고자 합니다. 직접 AI 서비스를 운영하는 입장에서 들었던 생각 및 고민도 함께 이야기 할 예정입니다.\n김우영 / 모니모니 @wooing \nAgentic Coding, Max Mode: 지치지 않는 일꾼, 극한까지 활용하기: Agentic Coding을 한도 꽉꽉 채워서 한 푼도 아깝지 않게 사용하고 싶지 않으신가요? 풀타임 일과 사이드프로젝트를 병행하면서, 어떻게 꾸역꾸역 그 워크플로우를 만들어나갔는지 공유드리겠습니다. 일이 너무 많은데 시간도 많으면 좋겠는 분들, 환영입니다.\n오효근 / 제논 @zerohertz \n오픈소스 LLM, vLLM으로 Production까지: 온프레미스 환경에서 LLM을 서빙하기 위한 프레임워크인 vLLM에 대해서 설명합니다.\n다른 LLM 서빙 프레임워크와 비교 및 특장 점을 설명할 예정이며, 내부적인 구조를 간단하게 살펴볼 예정입니다.\n홍승우 (Martin Hong) / Baryon Labs @martin \n백그라운드 에이전트 - 개발자와 로봇의 전쟁 시작: 마이크로서비스 아키텍처에도 도메인 바운더리를 지정하는 것 같은 에이전트를 지정하는 것에 대해 이야기하고자  합니다.\n황민호 (Robin Hwang) / 카카오\nAI Agent 시대, 코딩을 넘어 AI 오케스트레이션으로 진화: 실제 사례들을 통해 AI 오케스트레이션이 어떻게 복잡한 문제를 해결하고, 창의적인 서비스를 가능하게 하는지 보여드립니다.\n박정환 (maywell) / Instruct.KR & 벙커키즈 @Jeonghwan Park \nTBD\n"
#       }
#     ],
#     "chat_template_kwargs": {"enable_thinking": false}
#  }' | jq
#
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  6183  100  3550  100  2633     55     41  0:01:04  0:01:03  0:00:01  1043
# {
#   "id": "chatcmpl-7e7c1d2b3c1843178e309164e93a731d",
#   "object": "chat.completion",
#   "created": 1753882095,
#   "model": "Qwen/Qwen3-0.6B",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": null,
#         "content": "저는 당신의 요청에 따라 **Ultrathinking AI Agent Framework인 AgentKit**을 소개하고 있습니다. AgentKit는 블록체인 환경에서 AI Agent를 빠르게 만들기 위한 **비법**을 설명하고자 합니다.\n\n---\n\n### **AgentKit: 블록체인의 Ultrathinking AI Agent Framework**\n\nAgentKit는 **Ultrathinking Engineer**가 블록체인 환경에서 AI Agent를 만들기 위해 사용할 수 있는 **Framework**입니다. AgentKit는 빠르게 AI Agent를 구축할 수 있도록 **공학적 기술**과 **실용적인 도구**를 결합하여 제공합니다.\n\n#### ✅ **1. 빠르게 AI Agent를 만들기 위한 기술**\n- **Ultrathinking** 능력: AgentKit는 빠르게 핵심 기능을 핵심으로 갖춘 AI Agent를 만들 수 있도록 도와줍니다.\n- **Multi-Agent System** 구조: 여러 AI Agent를 결합하여 복잡한 문제를 해결할 수 있도록 설계되었습니다.\n- **High-performance** 기술: 빠르게 실행되는 AI Agent를 위한 최적화 기술을 지원합니다.\n\n#### ✅ **2. 블록체인 환경에서 빠르게 구축**\n- **Smart Contracts**과 **Blockchain**의 결합: AgentKit는 블록체인 기반의 AI Agent를 구축할 수 있도록 도와줍니다.\n- **Decentralized** 기반: AgentKit는 빠르게 AI Agent를 구축하는 데 최적화된 기술입니다.\n- **Scalability** 기능: AgentKit는 블록체인 기반의 AI Agent를 확장할 수 있도록 설계되었습니다.\n\n#### ✅ **3. 실용적인 도구**\n- **AgentKit API**를 통해 빠르게 AI Agent를 구축할 수 있습니다.\n- **Smart Contracts**와 **Blockchain**의 결합: AgentKit는 블록체인 기반의 AI Agent를 구축할 수 있도록 도와줍니다.\n\n---\n\n### **Ultrathinking Engineer가 블록체인 환경에서 빠르게 AI Agent를 만들기 위한 비법**\n\n- **Ultrathinking Engine**는 빠르게 핵심 기능을 핵심으로 갖춘 AI Agent를 만들 수 있도록 도와줍니다.\n- **Multi-Agent System** 구조: 여러 AI Agent를 결합하여 복잡한 문제를 해결할 수 있도록 설계되었습니다.\n- **High-performance** 기술: 빠르게 실행되는 AI Agent를 위한 최적화 기술을 지원합니다.\n\n---\n\n### **AgentKit의 특징**\n\n- **Ultrathinking Engine**로 빠르게 핵심 기능을 핵심으로 갖춘 AI Agent를 만들 수 있습니다.\n- **Multi-Agent System** 구조로 복잡한 문제를 해결할 수 있도록 설계되었습니다.\n- **High-performance** 기술로 빠르게 실행되는 AI Agent를 지원합니다.\n\n---\n\n### **Ultrathinking Engineer가 블록체인 환경에서 빠르게 AI Agent를 만들기 위한 비법**\n\n- **Ultrathinking Engine**로 빠르게 핵심 기능을 핵심으로 갖춘 AI Agent를 만들 수 있습니다.\n- **Multi-Agent System** 구조로 복잡한 문제를 해결할 수 있도록 설계되었습니다.\n- **High-performance** 기술로 빠르게 실행되는 AI Agent를 지원합니다.\n\n---\n\n**항상에 블록체인 기술과 AI Agent를 결합해 더 나은 서비스를 제공해 드릴게요!** 😊",
#         "tool_calls": []
#       },
#       "logprobs": null,
#       "finish_reason": "stop",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 698,
#     "total_tokens": 1531,
#     "completion_tokens": 833,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }

# $ curl -X POST http://localhost:8000/v1/chat/completions \
#         -H "Content-Type: application/json" \
#         -d '{
#     "model": "phh/Qwen3-0.6B-TLDR-Lora",
#     "messages": [
#       {
#         "role": "user",
#         "content": "강천성 (Logan Kang) / Dable & Coinbase (BASE) @Logan \nUltrathinking AI Agent in Base: Base 블록체인의 AI Agent Framework인 AgentKit를 소개합니다. Ultrathink Engineer가 블록체인 환경에서 빠르게 AI Agent를 만들 수 있는 비법을 소개합니다.\n고석현 / Sionic AI @정자초등학교 \nTBD\n채승우 / 하피챗 @cyoo \nPushing the boundaries of AI storytelling: 단일 LLM 요청으로 이루어진 기존 AI 롤플레이 시스템의 한계. 그리고 그 한계를 뛰어넘기 위해 astrsk에서 에이전틱 워크플로를 만든 과정을 설명합니다.\n현지웅 / 뤼튼테크놀로지스 @jiwunghyun \nChat 인터페이스와 플랫폼은 공존할 수 있을까?: Chat 인터페이스가 가져온 기존 플랫폼 공식의 변화에 대해 이야기하고 그에 대한 각 서비스들이 풀고 있는 전략들에 대해 이야기해보고자 합니다. 직접 AI 서비스를 운영하는 입장에서 들었던 생각 및 고민도 함께 이야기 할 예정입니다.\n김우영 / 모니모니 @wooing \nAgentic Coding, Max Mode: 지치지 않는 일꾼, 극한까지 활용하기: Agentic Coding을 한도 꽉꽉 채워서 한 푼도 아깝지 않게 사용하고 싶지 않으신가요? 풀타임 일과 사이드프로젝트를 병행하면서, 어떻게 꾸역꾸역 그 워크플로우를 만들어나갔는지 공유드리겠습니다. 일이 너무 많은데 시간도 많으면 좋겠는 분들, 환영입니다.\n오효근 / 제논 @zerohertz \n오픈소스 LLM, vLLM으로 Production까지: 온프레미스 환경에서 LLM을 서빙하기 위한 프레임워크인 vLLM에 대해서 설명합니다.\n다른 LLM 서빙 프레임워크와 비교 및 특장 점을 설명할 예정이며, 내부적인 구조를 간단하게 살펴볼 예정입니다.\n홍승우 (Martin Hong) / Baryon Labs @martin \n백그라운드 에이전트 - 개발자와 로봇의 전쟁 시작: 마이크로서비스 아키텍처에도 도메인 바운더리를 지정하는 것 같은 에이전트를 지정하는 것에 대해 이야기하고자  합니다.\n황민호 (Robin Hwang) / 카카오\nAI Agent 시대, 코딩을 넘어 AI 오케스트레이션으로 진화: 실제 사례들을 통해 AI 오케스트레이션이 어떻게 복잡한 문제를 해결하고, 창의적인 서비스를 가능하게 하는지 보여드립니다.\n박정환 (maywell) / Instruct.KR & 벙커키즈 @Jeonghwan Park \nTBD\n"
#       }
#     ],
#     "chat_template_kwargs": {"enable_thinking": false}
#  }' | jq
#
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  6094  100  3452  100  2642     43     33  0:01:20  0:01:19  0:00:01   789
# {
#   "id": "chatcmpl-5f9761a5127b434a950bd63bc7a3f537",
#   "object": "chat.completion",
#   "created": 1753882000,
#   "model": "phh/Qwen3-0.6B-TLDR-Lora",
#   "choices": [
#     {
#       "index": 0,
#       "message": {
#         "role": "assistant",
#         "reasoning_content": null,
#         "content": "저작권자: [이름]  \n작성일: [날짜]  \n작성자: [이름]  \n\n---\n\n**강천성 (Logan Kang) / Dable & Coinbase (BASE) @Logan**  \n**Ultrathinking AI Agent Framework인 AgentKit를 소개합니다.**  \n\n블록체인 환경에서 AI Agent를 만들기 위한 빠르고 효율적인 방법은 AgentKit입니다. AgentKit는 다양한 블록체인 기술과 기술을 결합하여, AI Agent를 구축할 수 있도록 합니다. AgentKit는 단순한 기능을 제공하지만, 기술의 혁신과 협업을 통해 빠르게 개발할 수 있도록 설계되었습니다.  \n\n---\n\n**고석현 / Sionic AI @정자초등학교**  \n**TBD**\n\n---\n\n**채승우 / 하피챗 @cyoo**  \n**단일 LLM 요청으로 이루어진 기존 AI 롤플레이 시스템의 한계**  \n**astrsk에서 에이전틱 워크플로를 만든 과정**  \n이러한 기능은 단순한 LLM을 요청하는 것보다, AI를 활용한 기능을 추가하는 것이 더 효과적입니다. astrsk의 에이전틱 워크플로는 기존 시스템의 한계를 넘어, 다양한 라이브러리를 활용해 복잡한 문제를 해결하고 있습니다.\n\n---\n\n**현지웅 / 뤼튼테크놀로지스 @jiwunghyun**  \n**Chat 인터페이스와 플랫폼은 공존할 수 있을까?**  \n**각 서비스가 풀고 있는 전략**  \n**AI 서비스를 운영하는 입장에서 들었던 생각 및 고민**  \n이러한 질문은 기술의 혁신을 위해 필요합니다. AI 서비스를 직접 운영하는 것이 아니라, 플랫폼을 통해 다양한 기능을 제공하는 것이 더 효과적입니다.\n\n---\n\n**김우영 / 모니모니 @wooing**  \n**Agentic Coding, Max Mode: 지치지 않는 일꾼, 극한까지 활용하기**  \n**Agentic Coding을 한도 꽉꽉 채워서 한 푼도 아깝지 않게 사용하고 싶지 않으신가요?**  \n**이러한 워크플로우를 병행하면서, 어떻게 만들어나가지는?**  \n이러한 질문은 기술의 혁신과 효율성을 강조합니다.\n\n---\n\n**오효근 / 제논 @zerohertz**  \n**오픈소스 LLM, vLLM으로 Production까지**  \n**vLLM과 비교 및 특장점**  \n**내부 구조를 간단히 살펴보겠습니다.**  \n이러한 설명은 기술의 구조를 이해하는 데 도움이 됩니다.\n\n---\n\n**홍승우 (Martin Hong) / Baryon Labs @martin**  \n**백그라운드 에이전트 - 개발자와 로봇의 전쟁 시작**  \n**Domain Border를 지정하는 것 같은 에이전트**  \n이러한 설명은 기술의 혁신을 위한 프레임워크를 설명합니다.\n\n---\n\n**황민호 (Robin Hwang) / 카카오**  \n**AI Agent 시대, 코딩을 넘어 AI 오케스트레이션으로 진화**  \n**실제 사례들을 통해 복잡한 문제를 해결하고, 창의적인 서비스를 가능하게 하는지**  \n이러한 질문은 AI의 역할을 이해하고, 기술의 혁신을 위한 실례를 제공합니다.\n\n---\n\n**박정환 (maywell) / Instruct.KR & 벙커키즈 @Jeonghwan Park**  \n**TBD**",
#         "tool_calls": []
#       },
#       "logprobs": null,
#       "finish_reason": "stop",
#       "stop_reason": null
#     }
#   ],
#   "usage": {
#     "prompt_tokens": 698,
#     "total_tokens": 1549,
#     "completion_tokens": 851,
#     "prompt_tokens_details": null
#   },
#   "prompt_logprobs": null,
#   "kv_transfer_params": null
# }
